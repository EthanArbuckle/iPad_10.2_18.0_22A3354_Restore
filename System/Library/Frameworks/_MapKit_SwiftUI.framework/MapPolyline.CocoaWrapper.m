@implementation MapPolyline.CocoaWrapper

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_coordinate);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (NSString)title
{
  return (NSString *)sub_21C5D5554((char *)self, (uint64_t)a2, (SEL *)&selRef_title);
}

- (void)setTitle:(id)a3
{
  sub_21C5D55F0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setTitle_);
}

- (NSString)subtitle
{
  return (NSString *)sub_21C5D5554((char *)self, (uint64_t)a2, (SEL *)&selRef_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_21C5D55F0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setSubtitle_);
}

- ($764D331F295A58AE6A687D38444EB1E5)boundingMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $764D331F295A58AE6A687D38444EB1E5 result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_boundingMapRect);
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (BOOL)intersectsMapRect:(id)a3
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_intersectsMapRect_, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)points
{
  void *v2;
  _TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper *v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped);
  v3 = self;
  v4 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)objc_msgSend(objc_retainAutorelease(v2), sel_points);

  return v4;
}

- (int64_t)pointCount
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_pointCount);
}

- (void)getCoordinates:(CLLocationCoordinate2D *)a3 range:(_NSRange)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_getCoordinates_range_, a3, a4.location, a4.length);
}

- (double)locationAtPointIndex:(int64_t)a3
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_locationAtPointIndex_, a3);
  return result;
}

- (id)locationsAtPointIndexes:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;

  v4 = sub_21C5E2D88();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C5E2D7C();
  v8 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped);
  v9 = self;
  v10 = (void *)sub_21C5E2D70();
  v11 = objc_msgSend(v8, sel_locationsAtPointIndexes_, v10);

  sub_21C531A4C(0, &qword_255289080);
  sub_21C5E39DC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = (void *)sub_21C5E39D0();
  swift_bridgeObjectRelease();
  return v12;
}

- (BOOL)_requiresModernMap
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel__requiresModernMap);
}

- (_TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper)init
{
  _TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper *result;

  result = (_TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped));
}

@end
