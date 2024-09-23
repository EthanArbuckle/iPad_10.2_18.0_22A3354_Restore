@implementation FIUITextView

- (void)centerTextVerticallyWithTopOffset:(double)a3
{
  double v4;

  -[FIUITextView bounds](self, "bounds");
  -[FIUITextView sizeThatFits:](self, "sizeThatFits:", v4, 1.79769313e308);
  -[FIUITextView contentOffset](self, "contentOffset");
  -[FIUITextView setContentOffset:](self, "setContentOffset:");
}

@end
