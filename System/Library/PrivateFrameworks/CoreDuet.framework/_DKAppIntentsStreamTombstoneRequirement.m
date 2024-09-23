@implementation _DKAppIntentsStreamTombstoneRequirement

- (id)predicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("streamName == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)eventPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("stream.name == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
