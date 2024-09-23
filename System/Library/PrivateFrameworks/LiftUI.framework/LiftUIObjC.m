@implementation LiftUIObjC

+ (id)viewControllerForJSON:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  return +[LiftUIFactory viewControllerWithJson:delegate:dataSource:](_TtC6LiftUI13LiftUIFactory, "viewControllerWithJson:delegate:dataSource:", a3, a4, a5);
}

+ (id)viewControllerForData:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  return +[LiftUIFactory viewControllerWithData:delegate:dataSource:](_TtC6LiftUI13LiftUIFactory, "viewControllerWithData:delegate:dataSource:", a3, a4, a5);
}

+ (id)viewControllerForURL:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  return +[LiftUIFactory viewControllerWithUrl:delegate:dataSource:](_TtC6LiftUI13LiftUIFactory, "viewControllerWithUrl:delegate:dataSource:", a3, a4, a5);
}

@end
