@implementation NSDocumentDeserializer

- (id)deserializeNewData
{
  return -[NSAKDeserializer deserializeData:](self, "deserializeData:", +[NSData allocWithZone:](NSPageData, "allocWithZone:", -[NSDocumentDeserializer zone](self, "zone")));
}

- (void)fixupDirInfo:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = -[NSDocumentDeserializer zone](self, "zone");
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("."));
  if (v5)
  {
    v8 = (id)objc_msgSend(v5, "deserializer");
    v6 = -[NSAKDeserializer initForDeserializerStream:](+[NSDirInfoDeserializer allocWithZone:](NSDirInfoDeserializer, "allocWithZone:", v4), "initForDeserializerStream:", v8);
    v7 = (void *)objc_msgSend(v6, "deserializePList:", +[NSDirInfo allocWithZone:](NSDirInfo, "allocWithZone:", v4));
    objc_msgSend(a3, "setObject:forKey:", v7, CFSTR("."));

  }
}

- (id)deserializeNewPList
{
  id v3;

  v3 = -[NSAKDeserializer deserializePList:](self, "deserializePList:", +[NSRTFD allocWithZone:](NSRTFD, "allocWithZone:", -[NSDocumentDeserializer zone](self, "zone")));
  -[NSDocumentDeserializer fixupDirInfo:](self, "fixupDirInfo:", v3);
  return v3;
}

@end
