@implementation _CDPortraitStreams

+ (id)topicStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/portrait/topic"));
}

+ (id)entityStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/portrait/entity"));
}

+ (id)allStreams
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "topicStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "entityStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
