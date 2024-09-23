@implementation MTFWrappedSentence

- (signed)fFlags
{
  return (__int16)-[MTFWrappedSentence elem](self, "elem")[56];
}

- (float)fDuration
{
  return (float)-[MTFWrappedSentence elem](self, "elem")[60];
}

- (signed)fNumWords
{
  return (__int16)-[MTFWrappedSentence elem](self, "elem")[64];
}

- (signed)fFinalRate
{
  return (__int16)-[MTFWrappedSentence elem](self, "elem")[66];
}

- (float)fBaseFloor
{
  return (float)-[MTFWrappedSentence elem](self, "elem")[68];
}

- (float)fBaseRange
{
  return (float)-[MTFWrappedSentence elem](self, "elem")[72];
}

- (float)fBaseRate
{
  return (float)-[MTFWrappedSentence elem](self, "elem")[76];
}

@end
