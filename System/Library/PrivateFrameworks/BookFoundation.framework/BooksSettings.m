@implementation BooksSettings

+ (id)shared
{
  return sub_21C44EA90((uint64_t)a1, (uint64_t)a2, &qword_255279F30, (id *)&qword_25527BA88);
}

- (BOOL)menuOnLeft
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___BooksSettings_defaults), sel_BKMenuOnLeft);
}

- (void)setMenuOnLeft:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___BooksSettings_defaults), sel_setBKMenuOnLeft_, a3);
}

- (NSString)filterBrightImagesKey
{
  return (NSString *)(id)sub_21C458E40();
}

- (BooksSettings)init
{
  uint64_t v2;
  uint64_t v3;
  BooksSettings *v4;
  void *v5;
  id v6;
  objc_super v8;

  v2 = OBJC_IVAR___BooksSettings_defaults;
  v3 = qword_255279F38;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = (void *)qword_25527BA90;
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_25527BA90;
  v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)BooksSettings;
  return -[BooksSettings init](&v8, sel_init);
}

- (void).cxx_destruct
{

}

@end
