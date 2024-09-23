@implementation PDFImageCell

- (_TtC18HealthExperienceUI12PDFImageCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI12PDFImageCell *)sub_1A96458D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI12PDFImageCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9646B3C();
}

- (void)prepareForReuse
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PDFImageCell();
  v2 = (char *)v3.receiver;
  -[PDFImageCell prepareForReuse](&v3, sel_prepareForReuse);
  ++*(_QWORD *)&v2[OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_lastRequestedPreviewImageId];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_imageView], sel_setImage_, 0, v3.receiver, v3.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_label], sel_setText_, 0);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_paginationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_label));
}

@end
