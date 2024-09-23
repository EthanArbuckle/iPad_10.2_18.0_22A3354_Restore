@implementation MTUITimeView

- (void)setTime:(double)a3
{
  id v4;

  self->_time = a3;
  FormatTime();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MTUITimeView setText:](self, "setText:", v4);

}

- (void)handleLocaleChange
{
  id v3;

  ResetTimeFormatter();
  FormatTime();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MTUITimeView setText:](self, "setText:", v3);

}

- (double)time
{
  return self->_time;
}

@end
