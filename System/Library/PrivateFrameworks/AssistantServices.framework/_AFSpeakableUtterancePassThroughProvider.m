@implementation _AFSpeakableUtterancePassThroughProvider

- (id)stringForExpression:(id)a3
{
  return -[_AFSpeakableUtterancePassThroughProvider stringForExpression:containsPrivacySensitiveContents:](self, "stringForExpression:containsPrivacySensitiveContents:", a3, 0);
}

- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4
{
  if (a4)
    *a4 = 0;
  return (id)objc_msgSend(a3, "copy");
}

@end
