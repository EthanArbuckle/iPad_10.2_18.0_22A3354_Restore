@implementation SFBrowsingAssistantCardItem

+ (id)consentCardWithNotNowHandler:(id)a3 continueHandler:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  v9 = _sSo27SFBrowsingAssistantCardItemC12MobileSafariE07consentC013notNowHandler08continueJ0AByyc_yyctFZ_0((uint64_t)sub_18B92A178, v7, (uint64_t)sub_18B92A178, v8);
  swift_release();
  swift_release();
  return v9;
}

+ (id)entityCardWithSearchResult:(id)a3 webpageIdentifier:(id)a4 componentIdentifier:(id)a5 actionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = _Block_copy(a6);
  if (a4)
  {
    v10 = sub_18BAC0DFC();
    a4 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  v13 = objc_allocWithZone((Class)SFBrowsingAssistantCardItem);
  v14 = a3;
  v15 = a5;
  v16 = objc_msgSend(v13, sel_init);
  objc_msgSend(v16, sel_setType_, 1);
  v17 = sub_18B94E274((uint64_t)v14, (uint64_t)sub_18B8928C8, v12, v10, a4, (uint64_t)v15);
  objc_msgSend(v16, sel_setCustomBodyView_, v17);

  swift_release();
  swift_bridgeObjectRelease();
  return v16;
}

+ (id)listenToPageCard
{
  id v2;

  v2 = objc_msgSend(objc_allocWithZone((Class)SFBrowsingAssistantCardItem), sel_init);
  objc_msgSend(v2, sel_setType_, 2);
  return v2;
}

+ (id)readerCardWithReaderContext:(id)a3 title:(id)a4 summary:(id)a5 disclaimer:(id)a6 contextMenuInteraction:(id)a7 showReaderHandler:(id)a8 listenToPageHandler:(id)a9 listenToPageActionState:(unint64_t)a10
{
  void *v15;
  uint64_t (*v16)();
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v27;
  uint64_t v28;

  v15 = _Block_copy(a8);
  v16 = (uint64_t (*)())_Block_copy(a9);
  if (a4)
  {
    v28 = sub_18BAC0DFC();
    a4 = v17;
    if (a5)
      goto LABEL_3;
LABEL_6:
    v27 = 0;
    if (a6)
      goto LABEL_4;
    goto LABEL_7;
  }
  v28 = 0;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v27 = sub_18BAC0DFC();
  a5 = v18;
  if (a6)
  {
LABEL_4:
    v19 = sub_18BAC0DFC();
    v21 = v20;
    goto LABEL_8;
  }
LABEL_7:
  v19 = 0;
  v21 = 0;
LABEL_8:
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v15;
  if (v16)
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v16;
    v16 = sub_18B92A178;
  }
  else
  {
    v23 = 0;
  }
  swift_unknownObjectRetain();
  v24 = a7;
  v25 = sub_18B94FB70((uint64_t)a3, v28, (uint64_t)a4, v27, (uint64_t)a5, v19, v21, (uint64_t)a7, (uint64_t)sub_18B92A178, v22, (uint64_t)v16, v23, a10);
  sub_18B8D1DAC((uint64_t)v16);
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v25;
}

+ (id)readerOptionsCardWithReaderContext:(id)a3 dismissReaderHandler:(id)a4 listenToPageHandler:(id)a5 listenToPageActionState:(unint64_t)a6
{
  void *v8;
  uint64_t (*v9)();
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v8 = _Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  if (v9)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    v9 = sub_18B92A178;
  }
  else
  {
    v11 = 0;
  }
  v12 = swift_unknownObjectRetain();
  v13 = _sSo27SFBrowsingAssistantCardItemC12MobileSafariE013readerOptionsC00G7Context20dismissReaderHandler012listenToPageL00mnO11ActionStateABSo08SFReaderI0_p_yycyycSgSo0rc6ListennopQ0VtFZ_0(v12, (uint64_t)sub_18B92A118, v10, (uint64_t)v9, v11, a6);
  sub_18B8D1DAC((uint64_t)v9);
  swift_unknownObjectRelease();
  swift_release();
  return v13;
}

- (NSString)bodyText
{
  return (NSString *)sub_18B94EFE4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_bodyText);
}

- (void)setBodyText:(id)a3
{
  sub_18B94F0C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___SFBrowsingAssistantCardItem_bodyText);
}

- (NSString)disclaimerText
{
  return (NSString *)sub_18B94EFE4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_disclaimerText);
}

- (void)setDisclaimerText:(id)a3
{
  sub_18B94F0C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___SFBrowsingAssistantCardItem_disclaimerText);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return (UIContextMenuInteraction *)sub_18B94EB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_contextMenuInteraction);
}

- (void)setContextMenuInteraction:(id)a3
{
  sub_18B94EBCC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SFBrowsingAssistantCardItem_contextMenuInteraction);
}

- (UIView)customBodyView
{
  return (UIView *)sub_18B94EB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_customBodyView);
}

- (void)setCustomBodyView:(id)a3
{
  sub_18B94EBCC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SFBrowsingAssistantCardItem_customBodyView);
}

- (UIAction)primaryAction
{
  return (UIAction *)sub_18B94EB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_primaryAction);
}

- (void)setPrimaryAction:(id)a3
{
  sub_18B94EBCC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SFBrowsingAssistantCardItem_primaryAction);
}

- (SFReaderContext)readerContext
{
  swift_beginAccess();
  return (SFReaderContext *)(id)swift_unknownObjectRetain();
}

- (void)setReaderContext:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantCardItem_readerContext);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (UIAction)secondaryAction
{
  return (UIAction *)sub_18B94EB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_secondaryAction);
}

- (void)setSecondaryAction:(id)a3
{
  sub_18B94EBCC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SFBrowsingAssistantCardItem_secondaryAction);
}

- (id)selectionHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantCardItem_selectionHandler);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18B94E394;
  aBlock[3] = &block_descriptor_12;
  v4 = _Block_copy(aBlock);
  sub_18BABFBB4();
  swift_release();
  return v4;
}

- (void)setSelectionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_18B9503E0;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SFBrowsingAssistantCardItem_selectionHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18B8D1DAC(v7);
}

- (NSString)title
{
  return (NSString *)sub_18B94EFE4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_title);
}

- (void)setTitle:(id)a3
{
  sub_18B94F0C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___SFBrowsingAssistantCardItem_title);
}

- (unint64_t)type
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___SFBrowsingAssistantCardItem_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___SFBrowsingAssistantCardItem_type);
  swift_beginAccess();
  *v4 = a3;
}

- (SFBrowsingAssistantCardItemObserving)observer
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___SFBrowsingAssistantCardItem_observer;
  swift_beginAccess();
  return (SFBrowsingAssistantCardItemObserving *)(id)MEMORY[0x18D77FD08](v2);
}

- (void)setObserver:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)notifyObserverCardDidUpdate
{
  SFBrowsingAssistantCardItemObserving *v2;
  SFBrowsingAssistantCardItem *v3;

  v3 = self;
  v2 = -[SFBrowsingAssistantCardItem observer](v3, sel_observer);
  if (v2)
  {
    -[SFBrowsingAssistantCardItemObserving cardItemDidUpdate:](v2, sel_cardItemDidUpdate_, v3);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (SFBrowsingAssistantCardItem)init
{
  return (SFBrowsingAssistantCardItem *)SFBrowsingAssistantCardItem.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  sub_18B8D1DAC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantCardItem_selectionHandler));
  swift_bridgeObjectRelease();
  sub_18B913BBC((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCardItem_observer);
}

@end
