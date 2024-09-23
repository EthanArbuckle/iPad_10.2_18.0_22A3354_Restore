@implementation _SwiftUIMKMapView

- (_TtC15_MapKit_SwiftUI17_SwiftUIMKMapView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _SwiftUIMKMapView();
  return -[_SwiftUIMKMapView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15_MapKit_SwiftUI17_SwiftUIMKMapView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _SwiftUIMKMapView();
  return -[_SwiftUIMKMapView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC15_MapKit_SwiftUI17_SwiftUIMKMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for _SwiftUIMKMapView();
  return -[_SwiftUIMKMapView initWithFrame:locationManager:](&v10, sel_initWithFrame_locationManager_, a4, x, y, width, height);
}

@end
