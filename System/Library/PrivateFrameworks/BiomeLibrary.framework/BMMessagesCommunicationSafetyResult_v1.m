@implementation BMMessagesCommunicationSafetyResult_v1

- (int)eventType
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMMessagesCommunicationSafetyResult_v1;
  v2 = -[BMMessagesCommunicationSafetyResult eventType](&v4, sel_eventType);
  if (v2 < 4)
    return v2 + 1;
  else
    return 0;
}

- (int)contentType
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMMessagesCommunicationSafetyResult_v1;
  v2 = -[BMMessagesCommunicationSafetyResult contentType](&v4, sel_contentType);
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

- (int)eventDirection
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMMessagesCommunicationSafetyResult_v1;
  v2 = -[BMMessagesCommunicationSafetyResult eventDirection](&v4, sel_eventDirection);
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

@end
