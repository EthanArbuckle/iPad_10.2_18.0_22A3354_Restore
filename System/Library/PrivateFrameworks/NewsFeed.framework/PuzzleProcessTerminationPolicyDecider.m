@implementation PuzzleProcessTerminationPolicyDecider

- (unint64_t)retryPolicy
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC8NewsFeed37PuzzleProcessTerminationPolicyDecider_retryPolicy);
}

- (void)setRetryPolicy:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed37PuzzleProcessTerminationPolicyDecider_retryPolicy) = (Class)a3;
}

- (_TtC8NewsFeed37PuzzleProcessTerminationPolicyDecider)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed37PuzzleProcessTerminationPolicyDecider_retryPolicy) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PuzzleProcessTerminationPolicyDecider();
  return -[PuzzleProcessTerminationPolicyDecider init](&v3, sel_init);
}

@end
