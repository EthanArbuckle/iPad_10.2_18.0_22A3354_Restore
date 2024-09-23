@implementation TransitDeparturesContainerSectionView

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC6MapsUI37TransitDeparturesContainerSectionView *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_191DCA1AC(v8);

}

- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(int64_t)a4
{
  return a4 != 0;
}

- (NSDirectionalEdgeInsets)_resolvedBottomSeparatorInsetsForView:(id)a3
{
  objc_class *ObjectType;
  uint64_t ObjCClassFromMetadata;
  id v7;
  _TtC6MapsUI37TransitDeparturesContainerSectionView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  NSDirectionalEdgeInsets result;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_191DC65A4(0, &qword_1EE235048);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = a3;
  v8 = self;
  if (objc_msgSend(v7, sel_isKindOfClass_, ObjCClassFromMetadata))
  {
    v9 = *MEMORY[0x1E0DC3298];
    v10 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v11 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v12 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  }
  else
  {
    v21.receiver = v8;
    v21.super_class = ObjectType;
    -[MUPlaceVerticalCardContainerView _resolvedBottomSeparatorInsetsForView:](&v21, sel__resolvedBottomSeparatorInsetsForView_, v7);
    v9 = v13;
    v10 = v14;
    v11 = v15;
    v12 = v16;
  }

  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  result.trailing = v20;
  result.bottom = v19;
  result.leading = v18;
  result.top = v17;
  return result;
}

- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithConfiguration:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_rowFeedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6 = (char *)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_departuresContainer;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[MUPlaceVerticalCardContainerView initWithConfiguration:](&v8, sel_initWithConfiguration_, a3);
}

- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithShowsSeparators:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_rowFeedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6 = (char *)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_departuresContainer;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v8, sel_initWithShowsSeparators_, v3);
}

- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_rowFeedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v9 = (char *)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_departuresContainer;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MUStackView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_rowFeedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6 = (char *)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_departuresContainer;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[TransitDeparturesContainerSectionView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_191DBE818((uint64_t)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_rowFeedbackDelegate);
  sub_191DCA330((uint64_t)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_departuresContainer, &qword_1EE235040);
}

@end
