@implementation FBKAttachmentManager

- (FBKAttachmentManager)initWithMatcherPredicates:(id)a3 pendingFileUrls:(id)a4 pendingExtensions:(id)a5 form:(id)a6 targetDevice:(id)a7 shouldGetSessionStatus:(BOOL)a8 shouldCheckDeferredLogs:(BOOL)a9 attachmentDescriptors:(id)a10 autoGathersDiagnosticExtensions:(BOOL)a11
{
  _BOOL8 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  FBKAttachmentManager *v23;
  FBKAttachmentManager *v24;
  uint64_t v25;
  NSArray *attachments;
  FBKFileCollector *v27;
  FBKFileCollector *deCollector;
  FBKDECollector *v29;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  FBKFileCollector *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  FBKAttachmentManager *v39;
  id v40;
  BOOL v41;
  BOOL v42;
  objc_super v43;

  v11 = a8;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v43.receiver = self;
  v43.super_class = (Class)FBKAttachmentManager;
  v23 = -[FBKAttachmentManager init](&v43, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_targetDevice, a7);
    v25 = objc_opt_new();
    attachments = v24->_attachments;
    v24->_attachments = (NSArray *)v25;

    v24->_autoGathersDiagnosticExtensions = a11;
    if (objc_msgSend(v20, "filerFormType") != 2)
    {
      if ((objc_msgSend(v21, "isCurrentDevice") & 1) != 0)
      {
        v27 = -[FBKFileCollector initWithFilerForm:attachmentDescriptors:]([FBKFileCollector alloc], "initWithFilerForm:attachmentDescriptors:", v20, v22);
        -[FBKFileCollector setListener:](v27, "setListener:", v24);
        objc_storeStrong((id *)&v24->_fileCollector, v27);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __203__FBKAttachmentManager_initWithMatcherPredicates_pendingFileUrls_pendingExtensions_form_targetDevice_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke;
        v32[3] = &unk_24E15AD88;
        v33 = v18;
        v34 = v27;
        v35 = v17;
        v36 = v21;
        v37 = v20;
        v38 = v19;
        v39 = v24;
        v41 = v11;
        v42 = a9;
        v40 = v22;
        deCollector = v27;
        +[FBKFileCollector findExistingFilesForFilerForm:matcherPredicates:completion:](FBKFileCollector, "findExistingFilesForFilerForm:matcherPredicates:completion:", v37, v35, v32);

      }
      else
      {
        LOBYTE(v31) = a9;
        v29 = -[FBKDECollector initWithRequirements:forDevice:filerForm:extensionsFromURL:listener:shouldGetSessionStatus:shouldCheckDeferredLogs:attachmentDescriptors:]([FBKDECollector alloc], "initWithRequirements:forDevice:filerForm:extensionsFromURL:listener:shouldGetSessionStatus:shouldCheckDeferredLogs:attachmentDescriptors:", v17, v21, v20, v19, v24, v11, v31, v22);
        deCollector = (FBKFileCollector *)v24->_deCollector;
        v24->_deCollector = v29;
      }

    }
  }

  return v24;
}

void __203__FBKAttachmentManager_initWithMatcherPredicates_pendingFileUrls_pendingExtensions_form_targetDevice_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  FBKDECollector *v9;
  FBKDECollector *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;

  v13 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  if (v13 | v6)
  {
    if (!v13)
    {
      v7 = v5;
      if (!v6)
        goto LABEL_5;
      goto LABEL_4;
    }
    objc_msgSend(*(id *)(a1 + 40), "attachDraftFiles:withRequirements:", v13, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
LABEL_4:
      objc_msgSend(*(id *)(a1 + 40), "attachURLSchemeFiles:withRequirements:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
  }
LABEL_5:
  v9 = [FBKDECollector alloc];
  LOBYTE(v12) = *(_BYTE *)(a1 + 97);
  v10 = -[FBKDECollector initWithRequirements:forDevice:filerForm:extensionsFromURL:listener:shouldGetSessionStatus:shouldCheckDeferredLogs:attachmentDescriptors:](v9, "initWithRequirements:forDevice:filerForm:extensionsFromURL:listener:shouldGetSessionStatus:shouldCheckDeferredLogs:attachmentDescriptors:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 96), v12, *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 80), "setDeCollector:", v10);
  objc_msgSend(*(id *)(a1 + 80), "fileCollector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDeCollector:", v10);

}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (FBKGroupedDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
  objc_storeStrong((id *)&self->_targetDevice, a3);
}

- (FBKDECollector)deCollector
{
  return self->_deCollector;
}

- (void)setDeCollector:(id)a3
{
  objc_storeStrong((id *)&self->_deCollector, a3);
}

- (FBKFileCollector)fileCollector
{
  return self->_fileCollector;
}

- (void)setFileCollector:(id)a3
{
  objc_storeStrong((id *)&self->_fileCollector, a3);
}

- (FBKAttachmentManagerDelegate)delegate
{
  return (FBKAttachmentManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)autoGathersDiagnosticExtensions
{
  return self->_autoGathersDiagnosticExtensions;
}

- (void)setAutoGathersDiagnosticExtensions:(BOOL)a3
{
  self->_autoGathersDiagnosticExtensions = a3;
}

- (NSSet)pendingRequirements
{
  return self->_pendingRequirements;
}

- (void)setPendingRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequirements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequirements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileCollector, 0);
  objc_storeStrong((id *)&self->_deCollector, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

- (NSString)description
{
  FBKAttachmentManager *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = -[FBKAttachmentManager attachments](v2, sel_attachments);
  v4 = sub_21DA3BF58(0, (unint64_t *)&unk_255399230);
  v5 = sub_21DAC496C();

  MEMORY[0x220798100](v5, v4);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (id)popPendingRequirements
{
  FBKAttachmentManager *v2;
  NSSet *v3;
  NSSet *v4;
  void *v5;

  v2 = self;
  v3 = -[FBKAttachmentManager pendingRequirements](v2, sel_pendingRequirements);
  if (v3)
  {
    v4 = v3;
    sub_21DA3BF58(0, &qword_255399140);
    sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
    sub_21DAC49D8();

    -[FBKAttachmentManager setPendingRequirements:](v2, sel_setPendingRequirements_, 0);
    v5 = (void *)sub_21DAC49CC();
    swift_bridgeObjectRelease();
  }
  else
  {

    v5 = 0;
  }
  return v5;
}

- (void)updateRequirements:(id)a3
{
  FBKAttachmentManager *v4;

  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  sub_21DAC49D8();
  v4 = self;
  FBKAttachmentManager.updateRequirements(_:)();

  swift_bridgeObjectRelease();
}

- (void)postLaunchAttachLocalFiles:(id)a3 allRequirements:(id)a4
{
  uint64_t v5;
  FBKAttachmentManager *v6;

  sub_21DAC3E44();
  v5 = sub_21DAC47EC();
  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  sub_21DAC49D8();
  v6 = self;
  FBKAttachmentManager.postLaunchAttachLocalFiles(_:allRequirements:)(v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)abortAllSessions
{
  FBKAttachmentManager *v2;

  v2 = self;
  FBKAttachmentManager.abortAllSessions()();

}

- (BOOL)isAttachmentParent:(id)a3
{
  FBKAttachment *v4;
  FBKAttachmentManager *v5;

  v4 = (FBKAttachment *)a3;
  v5 = self;
  LOBYTE(self) = FBKAttachmentManager.isAttachmentParent(_:)(v4);

  return self & 1;
}

- (BOOL)canDeleteAttachment:(id)a3
{
  return objc_msgSend(a3, sel_canBeDeleted);
}

- (BOOL)canCancelAttachmentCollection:(id)a3
{
  FBKAttachment *v4;
  FBKAttachmentManager *v5;

  v4 = (FBKAttachment *)a3;
  v5 = self;
  LOBYTE(self) = FBKAttachmentManager.canCancelAttachmentCollection(_:)(v4);

  return self & 1;
}

- (id)attachmentForIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  FBKAttachmentManager *v9;
  unint64_t v10;
  NSArray *v11;
  uint64_t v12;
  id result;
  id v14;
  void *v15;
  uint64_t v16;

  v4 = sub_21DAC3F28();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC3EF8();
  v9 = self;
  v10 = sub_21DAC3F10();
  v11 = -[FBKAttachmentManager attachments](v9, sel_attachments);
  sub_21DA3BF58(0, (unint64_t *)&unk_255399230);
  v12 = sub_21DAC496C();

  if ((v12 & 0xC000000000000001) != 0)
  {
    v14 = (id)MEMORY[0x220798484](v10, v12);
    goto LABEL_5;
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v10 < *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v14 = *(id *)(v12 + 8 * v10 + 32);
LABEL_5:
    v15 = v14;

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return v15;
  }
  __break(1u);
  return result;
}

- (int64_t)attachmentIndex:(id)a3
{
  id v4;
  FBKAttachmentManager *v5;
  NSArray *v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  char v10;
  char v11;

  v4 = a3;
  v5 = self;
  v6 = -[FBKAttachmentManager attachments](v5, sel_attachments);
  sub_21DA3BF58(0, (unint64_t *)&unk_255399230);
  v7 = sub_21DAC496C();

  sub_21DA481F0((uint64_t)v4, v7, (unint64_t *)&unk_255399230);
  v9 = v8;
  v11 = v10;

  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
    return -1;
  else
    return v9;
}

- (void)removeAllAttachments
{
  FBKAttachmentManager *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;

  v2 = self;
  v3 = sub_21DA45C94();
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_10:

    swift_bridgeObjectRelease();
    return;
  }
  v4 = sub_21DAC4DBC();
  if (!v4)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        v6 = (void *)MEMORY[0x220798484](i, v3);
      }
      else
      {
        v6 = *(void **)(v3 + 8 * i + 32);
        swift_unknownObjectRetain();
      }
      objc_msgSend(v6, sel_removeAllAttachments);
      swift_unknownObjectRelease();
    }
    goto LABEL_10;
  }
  __break(1u);
}

- (BOOL)hasUnmetRequirementAttachments
{
  FBKAttachmentManager *v2;
  FBKDECollector *v3;
  FBKAttachmentManager *v4;
  unsigned __int8 v5;

  v2 = self;
  v3 = -[FBKAttachmentManager deCollector](v2, sel_deCollector);
  if (v3)
  {
    v4 = (FBKAttachmentManager *)v3;
    v5 = -[FBKDECollector hasUnmetRequirements](v3, sel_hasUnmetRequirements);

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasFilePromises
{
  FBKAttachmentManager *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = FBKAttachmentManager.hasFilePromises()();

  return v3;
}

- (void)addAttachmentWithItemProvider:(id)a3
{
  id v4;
  FBKAttachmentManager *v5;
  FBKFileCollector *v6;

  v4 = a3;
  v5 = self;
  v6 = -[FBKAttachmentManager fileCollector](v5, sel_fileCollector);
  -[FBKFileCollector addAttachmentWithItemProvider:](v6, sel_addAttachmentWithItemProvider_, v4);

}

- (void)addFileFrom:(id)a3 byMoving:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  FBKAttachmentManager *v11;
  FBKFileCollector *v12;
  FBKFileCollector *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  v6 = sub_21DAC3E44();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC3E20();
  v11 = self;
  v12 = -[FBKAttachmentManager fileCollector](v11, sel_fileCollector);
  if (v12)
  {
    v13 = v12;
    v14 = sub_21DAC3DFC();
    -[FBKFileCollector addFileFromURL:byMoving:](v13, sel_addFileFromURL_byMoving_, v14, v4);

    v11 = (FBKAttachmentManager *)v14;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)gatherAttachment:(id)a3 answers:(id)a4
{
  void *v6;
  FBKAttachment *v7;
  FBKAttachmentManager *v8;
  Swift::OpaquePointer_optional v9;

  if (a4)
    v6 = (void *)sub_21DAC47EC();
  else
    v6 = 0;
  v7 = (FBKAttachment *)a3;
  v8 = self;
  v9.value._rawValue = v6;
  FBKAttachmentManager.gatherAttachment(_:answers:)(v7, v9);

  swift_bridgeObjectRelease();
}

- (void)gatherFilesWithDedExtension:(id)a3 answers:(id)a4
{
  id v6;
  FBKAttachmentManager *v7;

  sub_21DAC47EC();
  v6 = a3;
  v7 = self;
  sub_21DA48FA4(a3);

  swift_bridgeObjectRelease();
}

- (void)attachmentProvider:(id)a3 didFinishLoadingWithAttachments:(id)a4 error:(id)a5
{
  uint64_t v8;
  FBKAttachmentManager *v9;
  id v10;

  sub_21DA3BF58(0, (unint64_t *)&unk_255399230);
  sub_21DA3BF18(&qword_255399248, (unint64_t *)&unk_255399230, (uint64_t)off_24E155A18, MEMORY[0x24BEE5BD8]);
  v8 = sub_21DAC49D8();
  swift_unknownObjectRetain();
  v9 = self;
  v10 = a5;
  FBKAttachmentManager.attachmentProvider(_:didFinishLoadingWith:error:)(a3, v8, (uint64_t)a5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)attachmentProvider:(id)a3 didStartAttaching:(id)a4
{
  id v6;
  FBKAttachmentManager *v7;
  FBKAttachmentManagerDelegate *v8;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  v8 = -[FBKAttachmentManager delegate](v7, sel_delegate);
  if (v8)
  {
    -[FBKAttachmentManagerDelegate attachmentManager:didStartAttaching:](v8, sel_attachmentManager_didStartAttaching_, v7, v6);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  swift_unknownObjectRelease();
}

- (void)attachmentProvider:(id)a3 didFinishAttaching:(id)a4 error:(id)a5
{
  FBKAttachmentManager *v8;
  id v9;
  FBKAttachmentManagerDelegate *v10;
  FBKAttachmentManagerDelegate *v11;
  void *v12;
  id v13;

  swift_unknownObjectRetain();
  v13 = a4;
  v8 = self;
  v9 = a5;
  v10 = -[FBKAttachmentManager delegate](v8, sel_delegate);
  if (v10)
  {
    v11 = v10;
    if (v9)
      v12 = (void *)sub_21DAC3DC0();
    else
      v12 = 0;
    -[FBKAttachmentManagerDelegate attachmentManager:didFinishAttaching:error:](v11, sel_attachmentManager_didFinishAttaching_error_, v8, v13, v12);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  swift_unknownObjectRelease();

}

- (void)attachmentProvider:(id)a3 didUpdateAttachment:(id)a4
{
  id v6;
  FBKAttachmentManager *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_21DA53224(v6);
  swift_unknownObjectRelease();

}

- (void)attachmentProvider:(id)a3 didAddAttachment:(id)a4
{
  id v6;
  FBKAttachmentManager *v7;
  FBKAttachmentManagerDelegate *v8;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_21DA47670();
  v8 = -[FBKAttachmentManager delegate](v7, sel_delegate);
  if (v8)
  {
    -[FBKAttachmentManagerDelegate attachmentManager:didAddAttachment:atIndex:](v8, sel_attachmentManager_didAddAttachment_atIndex_, v7, v6, -[FBKAttachmentManager attachmentIndex:](v7, sel_attachmentIndex_, v6));

    swift_unknownObjectRelease();
  }
  else
  {

  }
  swift_unknownObjectRelease();
}

- (void)attachmentProvider:(id)a3 didTakeAttachment:(id)a4 fromOtherProvider:(id)a5
{
  FBKAttachment *v7;
  FBKAttachmentManager *v8;

  swift_unknownObjectRetain();
  v7 = (FBKAttachment *)a4;
  swift_unknownObjectRetain();
  v8 = self;
  FBKAttachmentManager.removeAttachment(_:)(v7);
  sub_21DA47670();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)attachmentProvider:(id)a3 didRemoveAttachment:(id)a4
{
  id v7;
  FBKAttachmentManager *v8;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  FBKAttachmentManager.attachmentProvider(_:didRemove:)(a3, v7);
  swift_unknownObjectRelease();

}

@end
