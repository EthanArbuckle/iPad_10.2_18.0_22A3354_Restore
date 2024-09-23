@implementation CarouselBalloonViewDataSourceManager

- (_TtC7ChatKit36CarouselBalloonViewDataSourceManager)init
{
  _TtC7ChatKit36CarouselBalloonViewDataSourceManager *v2;
  id v3;
  _TtC7ChatKit36CarouselBalloonViewDataSourceManager *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CarouselBalloonViewDataSourceManager();
  v2 = -[PXSectionedDataSourceManager init](&v7, sel_init);
  v3 = objc_allocWithZone((Class)type metadata accessor for CarouselBalloonViewDataSource());
  v4 = v2;
  v5 = objc_msgSend(v3, sel_init);
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](v4, sel_setDataSource_changeDetails_, v5, 0);

  return v4;
}

- (id)createInitialDataSource
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CarouselBalloonViewDataSource()), sel_init);
}

@end
