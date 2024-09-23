@implementation _ASWebsiteNameDictionarySnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3;
  _ASWebsiteNameDictionary *v4;

  v3 = a3;
  v4 = -[_ASWebsiteNameDictionary initWithSnapshotData:error:]([_ASWebsiteNameDictionary alloc], "initWithSnapshotData:error:", v3, 0);

  return v4;
}

@end
