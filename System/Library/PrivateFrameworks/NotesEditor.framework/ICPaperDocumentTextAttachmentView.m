@implementation ICPaperDocumentTextAttachmentView

- (NSArray)supportedRotorTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("ICAccessibilityRotorTypeAttachments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)_icaxRangeInTextStorage
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  _NSRange result;

  -[ICPaperDocumentTextAttachmentView _icaxEnclosingTextView](self, "_icaxEnclosingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3010000000;
  v15 = &unk_1DDA28851;
  v16 = xmmword_1DD9E6F90;
  v5 = objc_msgSend(v4, "length");
  v6 = *MEMORY[0x1E0DC10F8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__ICPaperDocumentTextAttachmentView_Accessibility___icaxRangeInTextStorage__block_invoke;
  v11[3] = &unk_1EA7DE008;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v11);
  v7 = v13[4];
  v8 = v13[5];
  _Block_object_dispose(&v12, 8);

  v9 = v7;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

void __75__ICPaperDocumentTextAttachmentView_Accessibility___icaxRangeInTextStorage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  id v10;
  id v11;
  uint64_t v12;

  v9 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v9, "textAttachment");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v12 + 32) = a3;
    *(_QWORD *)(v12 + 40) = a4;
    *a5 = 1;
  }
}

- (id)_icaxEnclosingTextView
{
  id v2;
  uint64_t v3;

  -[ICPaperDocumentTextAttachmentView superview](self, "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v3;
      if (!v3)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:

  return v2;
}

- (id)paperDocumentEngagementData
{
  ICPaperDocumentTextAttachmentView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1DD8F9BD4();
  swift_unknownObjectRetain();

  return v3;
}

- (void)resetPaperDocumentEngagementData
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData))
    sub_1DD9C25F0();
}

- (void)paperDidSaveDidQuiesce
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_isRevertingChanges) = 0;
}

- (_TtC11NotesEditor27PaperDocumentEngagementData)engagementData
{
  return (_TtC11NotesEditor27PaperDocumentEngagementData *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData);
}

- (void)setEngagementData:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData) = (Class)a3;
  v3 = a3;

}

- (NSArray)accessibilityElements
{
  ICPaperDocumentTextAttachmentView *v2;
  _QWORD *v3;
  void *v4;

  v2 = self;
  v3 = sub_1DD8D0220();

  if (v3)
  {
    v4 = (void *)sub_1DD9D229C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PaperDocumentTextAttachmentView();
  -[ICPaperDocumentTextAttachmentView bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  ICPaperDocumentTextAttachmentView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  objc_super v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for PaperDocumentTextAttachmentView();
  v23.receiver = self;
  v23.super_class = v8;
  v9 = self;
  -[ICPaperDocumentTextAttachmentView bounds](&v23, sel_bounds);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v22.receiver = v9;
  v22.super_class = v8;
  -[ICPaperDocumentTextAttachmentView setBounds:](&v22, sel_setBounds_, x, y, width, height);
  -[ICPaperDocumentTextAttachmentView bounds](v9, sel_bounds);
  v25.origin.x = v18;
  v25.origin.y = v19;
  v25.size.width = v20;
  v25.size.height = v21;
  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  if (!CGRectEqualToRect(v24, v25))
    sub_1DD8DC328(1, 0);

}

- (NSTextAttachment)textAttachment
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_textAttachment);
  swift_beginAccess();
  return (NSTextAttachment *)*v2;
}

- (void)setTextAttachment:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_textAttachment);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)willMoveToWindow:(id)a3
{
  ICPaperDocumentTextAttachmentView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1DD8D3A70(a3);

}

- (void)didMoveToWindow
{
  ICPaperDocumentTextAttachmentView *v2;

  v2 = self;
  sub_1DD8D49EC();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for PaperDocumentTextAttachmentView();
  v7 = v15.receiver;
  v8 = a4;
  v9 = -[ICPaperDocumentTextAttachmentView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_1DD7C0C74(0, (unint64_t *)&qword_1EDBFA240);
    v11 = v7;
    v12 = v10;
    v13 = sub_1DD9D28E4();

    v8 = v12;
    if ((v13 & 1) == 0)
      return v12;
  }
  else
  {

  }
  v12 = 0;
  return v12;
}

- (ICPaperDocumentTextAttachmentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DD8FA63C();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  ICPaperDocumentTextAttachmentView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1DD8DA6D8(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  ICPaperDocumentTextAttachmentView *v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DD8DAA28(v6, v7);
  v10 = v9;

  return v10 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  ICPaperDocumentTextAttachmentView *v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DD8DAD20(v6, v7);
  v10 = v9;

  return v10 & 1;
}

- (void)pinch:(id)a3
{
  ICPaperDocumentTextAttachmentView *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1DD8DB19C(v5);

}

- (void)updateHeaderConfiguration
{
  ICPaperDocumentTextAttachmentView *v2;

  v2 = self;
  sub_1DD8DC508();

}

- (void)quickLook:(id)a3
{
  ICPaperDocumentTextAttachmentView *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1DD8DED94(0);

}

- (void)dealloc
{
  ICPaperDocumentTextAttachmentView *v2;
  id v3;
  void *v4;
  objc_super v5;

  v2 = self;
  v3 = -[ICPaperDocumentTextAttachmentView undoManager](v2, sel_undoManager);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_removeAllActionsWithTarget_, v2);

  }
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for PaperDocumentTextAttachmentView();
  -[ICPaperDocumentTextAttachmentView dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_viewControllerForPresentingUI));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView____lazy_storage___paperDidSaveSelectorDelayer));
  sub_1DD8FF244((uint64_t)self + OBJC_IVAR___ICPaperDocumentTextAttachmentView_attachmentChangeNotifications, (uint64_t *)&unk_1EDBF9E38);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView____lazy_storage___smallBrickView));
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_textAttachment));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_inlinePaperDocumentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_paperDocumentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_placeholderContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_internalErrorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_quickLookTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_pinchToResizeGestureRecognizer));

  sub_1DD8FF058((uint64_t)self + OBJC_IVAR___ICPaperDocumentTextAttachmentView_liveStreamMessenger);
  swift_unknownObjectRelease();
  sub_1DD8FF058((uint64_t)self + OBJC_IVAR___ICPaperDocumentTextAttachmentView_textualContextProvider);
}

- (id)tiledViewAttachmentViews
{
  sub_1DD7C0C74(0, &qword_1F03F6C68);
  return (id)sub_1DD9D229C();
}

- (ICPaperDocumentTextAttachmentView)initWithFrame:(CGRect)a3
{
  sub_1DD8F3BCC();
}

- (void)imageForTextPreviewUsingFindingResult:(id)a3 inTextView:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  ICPaperDocumentTextAttachmentView *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1DD8FB554(a3, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (id)viewForTextDragPreview
{
  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_displayMode)
    && *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICPaperDocumentTextAttachmentView_paperDocumentContainerView))
  {
    self = *(ICPaperDocumentTextAttachmentView **)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___ICPaperDocumentTextAttachmentView_paperDocumentContainerView);
  }
  return self;
}

- (double)additionalXOffsetForTextDragPreviewInTextView:(id)a3
{
  id v4;
  ICPaperDocumentTextAttachmentView *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = self;
  PaperDocumentTextAttachmentView.additionalXOffsetForTextDragPreview(in:)(v4);
  v7 = v6;

  return v7;
}

- (void)layoutSubviews
{
  ICPaperDocumentTextAttachmentView *v2;

  v2 = self;
  PaperDocumentTextAttachmentView.layoutSubviews()();

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  ICPaperDocumentTextAttachmentView *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = _s11NotesEditor31PaperDocumentTextAttachmentViewC22contextMenuInteraction_016configurationForI10AtLocationSo09UIContextI13ConfigurationCSgSo0oiJ0C_So7CGPointVtF_0();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  ICPaperDocumentTextAttachmentView *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = _s11NotesEditor31PaperDocumentTextAttachmentViewC22contextMenuInteraction_022previewForHighlightingI17WithConfigurationSo17UITargetedPreviewCSgSo09UIContextiJ0C_So0riO0CtF_0();

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  ICPaperDocumentTextAttachmentView *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_1DD8FC0F8(a5);

  swift_unknownObjectRelease();
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (NSString)accessibilityLabel
{
  ICPaperDocumentTextAttachmentView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  PaperDocumentTextAttachmentView.accessibilityLabel.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DD9D2140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end
