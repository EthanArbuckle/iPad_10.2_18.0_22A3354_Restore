@implementation CNKTranscriptionViewComposerFactory

- (id)makeViewComposer
{
  CNKTranscriptionViewComposerFactory *v2;
  id v3;

  v2 = self;
  v3 = CNKTranscriptionViewComposerFactory.makeViewComposer()();

  return v3;
}

- (CNKTranscriptionViewComposerFactory)init
{
  return (CNKTranscriptionViewComposerFactory *)CNKTranscriptionViewComposerFactory.init()();
}

@end
