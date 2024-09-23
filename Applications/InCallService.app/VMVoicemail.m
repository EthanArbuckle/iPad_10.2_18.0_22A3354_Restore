@implementation VMVoicemail

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(float)a3
{
  double v6;

  if ((-[VMVoicemail isRead](self, "isRead") & 1) != 0)
    return 0;
  if (a3 > 5.0)
    return 1;
  -[VMVoicemail duration](self, "duration");
  return v6 / 3.0 < a3;
}

@end
