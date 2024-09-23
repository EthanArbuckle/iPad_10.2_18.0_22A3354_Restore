@implementation DOCICloudRootNode

- (FPItem)fpfs_fpItem
{
  return (FPItem *)sub_21EA54368((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_fpfs_fpItem);
}

- (BOOL)isRootItem
{
  return 1;
}

- (NSString)providerDomainID
{
  return (NSString *)sub_21EA53058((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_providerDomainID, (SEL *)&selRef_identifier);
}

- (BOOL)isShared
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isShared);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_deferredCreationNode));
  sub_21EA5CA7C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_providerDomain));
}

- (BOOL)isFolder
{
  return sub_21EAFE524((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isFolder);
}

- (NSURL)fileURL
{
  return (NSURL *)sub_21EAFE814(self, (uint64_t)a2, (uint64_t *)&unk_2540A6520, (void (*)(void))DOCICloudRootNode.fileURL.getter, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCD8D0]);
}

- (NSString)displayName
{
  _TtC26DocumentManagerExecutables17DOCICloudRootNode *v2;
  void *v3;

  v2 = self;
  DOCICloudRootNode.displayName.getter();

  v3 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isWritable
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isWritable);
}

- (_TtC26DocumentManagerExecutables17DOCICloudRootNode)initWithCoder:(id)a3
{
  sub_21EAFD1FC(a3);
  return 0;
}

- (_TtC26DocumentManagerExecutables17DOCICloudRootNode)init
{
  _TtC26DocumentManagerExecutables17DOCICloudRootNode *result;

  result = (_TtC26DocumentManagerExecutables17DOCICloudRootNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)identifier
{
  _TtC26DocumentManagerExecutables17DOCICloudRootNode *v2;
  void *v3;
  _QWORD v5[4];

  v2 = self;
  DOCICloudRootNode.identifier.getter((uint64_t)v5);

  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  v3 = (void *)sub_21EB034B8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

- (UTType)contentType
{
  return (UTType *)sub_21EAFDF28(self, (uint64_t)a2, (uint64_t (*)(_QWORD))MEMORY[0x24BEE63B8], (void (*)(void))DOCICloudRootNode.contentType.getter, MEMORY[0x24BEE6238]);
}

- (NSString)typeIdentifier
{
  void *v2;
  _TtC26DocumentManagerExecutables17DOCICloudRootNode *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v2)
  {
    v3 = self;
    v4 = objc_msgSend(v2, sel_typeIdentifier);
    sub_21EB02B88();

  }
  v5 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSNumber)fileSize
{
  return (NSNumber *)sub_21EA54368((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_fileSize);
}

- (NSNumber)childItemCount
{
  return (NSNumber *)sub_21EA54368((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_childItemCount);
}

- (NSString)providerID
{
  return (NSString *)sub_21EA53058((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_providerID, (SEL *)&selRef_providerID);
}

- (NSDate)creationDate
{
  return (NSDate *)sub_21EAFDF28(self, (uint64_t)a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], (void (*)(void))DOCICloudRootNode.creationDate.getter, MEMORY[0x24BDCE5D8]);
}

- (NSDate)doc_creationDate
{
  return (NSDate *)sub_21EAFE814(self, (uint64_t)a2, (uint64_t *)&unk_2540A6530, (void (*)(void))DOCICloudRootNode.doc_creationDate.getter, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], MEMORY[0x24BDCE5D8]);
}

- (NSDate)modificationDate
{
  return (NSDate *)sub_21EAFE814(self, (uint64_t)a2, (uint64_t *)&unk_2540A6530, (void (*)(void))DOCICloudRootNode.modificationDate.getter, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], MEMORY[0x24BDCE5D8]);
}

- (NSDate)doc_lastUsedDate
{
  return (NSDate *)sub_21EAFE814(self, (uint64_t)a2, (uint64_t *)&unk_2540A6530, (void (*)(void))DOCICloudRootNode.doc_lastUsedDate.getter, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], MEMORY[0x24BDCE5D8]);
}

- (NSDate)dateForSortingByRecents
{
  return (NSDate *)sub_21EAFE814(self, (uint64_t)a2, (uint64_t *)&unk_2540A6530, (void (*)(void))DOCICloudRootNode.dateForSortingByRecents.getter, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], MEMORY[0x24BDCE5D8]);
}

- (NSString)filename
{
  void *v2;
  _TtC26DocumentManagerExecutables17DOCICloudRootNode *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v2)
  {
    v3 = self;
    v4 = objc_msgSend(v2, sel_filename);
    sub_21EB02B88();

  }
  v5 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (BOOL)isActionable
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isActionable);
}

- (BOOL)isReadable
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isReadable);
}

- (BOOL)isPending
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isPending);
}

- (BOOL)isExternalDownloadPlaceholder
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isExternalDownloadPlaceholder);
}

- (BOOL)isCloudItem
{
  return sub_21EAFE524((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isCloudItem);
}

- (BOOL)isContainer
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isContainer);
}

- (BOOL)isTrashed
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isTrashed);
}

- (BOOL)isDownloading
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isDownloading);
}

- (BOOL)isDownloaded
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isDownloaded);
}

- (NSProgress)downloadingProgress
{
  return (NSProgress *)sub_21EA54368((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_downloadingProgress);
}

- (NSError)downloadingError
{
  return (NSError *)sub_21EAFE674((char *)self, (uint64_t)a2, (SEL *)&selRef_downloadingError);
}

- (BOOL)isUploading
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isUploading);
}

- (BOOL)isUploaded
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isUploaded);
}

- (NSProgress)uploadingProgress
{
  return (NSProgress *)sub_21EA54368((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_uploadingProgress);
}

- (NSError)uploadingError
{
  return (NSError *)sub_21EAFE674((char *)self, (uint64_t)a2, (SEL *)&selRef_uploadingError);
}

- (NSProgress)copyingProgress
{
  return (NSProgress *)sub_21EA54368((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_copyingProgress);
}

- (BOOL)isSharedByCurrentUser
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isSharedByCurrentUser);
}

- (BOOL)isTopLevelSharedItem
{
  return sub_21EA5ADF8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isTopLevelSharedItem);
}

- (NSPersonNameComponents)ownerNameComponents
{
  return (NSPersonNameComponents *)sub_21EAFE814(self, (uint64_t)a2, &qword_2540A6518, (void (*)(void))DOCICloudRootNode.ownerNameComponents.getter, (uint64_t (*)(_QWORD))MEMORY[0x24BDCCC10], MEMORY[0x24BDCCBB0]);
}

- (NSArray)itemDecorations
{
  void *v2;
  _TtC26DocumentManagerExecutables17DOCICloudRootNode *v3;
  _TtC26DocumentManagerExecutables17DOCICloudRootNode *v4;
  _TtC26DocumentManagerExecutables17DOCICloudRootNode *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v2)
  {
    v3 = self;
    v4 = (_TtC26DocumentManagerExecutables17DOCICloudRootNode *)objc_msgSend(v2, sel_itemDecorations);
    if (v4)
    {
      v5 = v4;
      sub_21EA579D4(0, &qword_25546A7D8);
      sub_21EB02CF0();

      v3 = v5;
    }
  }
  else
  {
    v3 = self;
  }

  sub_21EA579D4(0, &qword_25546A7D8);
  v6 = (void *)sub_21EB02CE4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (NSArray)tags
{
  void *v2;
  _TtC26DocumentManagerExecutables17DOCICloudRootNode *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v2)
    goto LABEL_5;
  v3 = self;
  v4 = objc_msgSend(v2, sel_tags);
  if (!v4)
  {

LABEL_5:
    v6 = 0;
    return (NSArray *)v6;
  }
  v5 = v4;
  sub_21EA579D4(0, (unint64_t *)&unk_25546BFB0);
  sub_21EB02CF0();

  v6 = (void *)sub_21EB02CE4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (int64_t)localizedStandardTagsCompareNode:(id)a3
{
  return (int64_t)sub_21EAFEBE0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_localizedStandardTagsCompareNode_);
}

- (int64_t)_doc_fileTypeCompare:(id)a3
{
  return (int64_t)sub_21EAFEBE0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef__doc_fileTypeCompare_);
}

@end
