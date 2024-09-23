@implementation FMUILocationDetailViewControllerViewOptions

- (FMUILocationDetailViewControllerViewOptions)initWithRawValue:(int64_t)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FMUILocationDetailViewControllerViewOptions_rawValue) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LocationDetailViewController.ViewOptions();
  return -[FMUILocationDetailViewControllerViewOptions init](&v4, sel_init);
}

+ (FMUILocationDetailViewControllerViewOptions)showLocationDetails
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D38, (id *)&qword_256A61E60);
}

+ (FMUILocationDetailViewControllerViewOptions)showShareLocationButton
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D40, (id *)&qword_256A61E68);
}

+ (FMUILocationDetailViewControllerViewOptions)showRequestLocationButton
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D48, (id *)&qword_256A61E70);
}

+ (FMUILocationDetailViewControllerViewOptions)showLocateButtons
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D50, (id *)&qword_256A61E78);
}

+ (FMUILocationDetailViewControllerViewOptions)presentFullScreenWhenTapped
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D58, (id *)&qword_256A61E80);
}

+ (FMUILocationDetailViewControllerViewOptions)punchOutToFindMyWhenTapped
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D60, (id *)&qword_256A61E88);
}

+ (FMUILocationDetailViewControllerViewOptions)useCompactInterface
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D68, (id *)&qword_256A61E90);
}

+ (FMUILocationDetailViewControllerViewOptions)spotlightWidget
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D70, (id *)&qword_256A61E98);
}

+ (FMUILocationDetailViewControllerViewOptions)messagesChatDetails
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D78, (id *)&qword_256A61EA0);
}

+ (FMUILocationDetailViewControllerViewOptions)default
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_23BAFB878((uint64_t)a1, (uint64_t)a2, &qword_256A58D80, (id *)&qword_256A61EA8);
}

- (int64_t)hash
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FMUILocationDetailViewControllerViewOptions_rawValue);
}

- (BOOL)isEqual:(id)a3
{
  FMUILocationDetailViewControllerViewOptions *v4;
  FMUILocationDetailViewControllerViewOptions *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23BB8AD18();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_23BAFC33C((uint64_t)v8);

  sub_23BAFC40C((uint64_t)v8);
  return v6;
}

- (FMUILocationDetailViewControllerViewOptions)init
{
  FMUILocationDetailViewControllerViewOptions *result;

  result = (FMUILocationDetailViewControllerViewOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
