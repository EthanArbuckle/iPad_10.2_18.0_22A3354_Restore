@implementation AGAppObserver

+ (void)foreground:(id)a3
{
  AG::Graph::all_mark_profile((AG::Graph *)"app/foreground", a2);
}

+ (void)background:(id)a3
{
  AG::Graph::all_mark_profile((AG::Graph *)"app/background", a2);
}

@end
