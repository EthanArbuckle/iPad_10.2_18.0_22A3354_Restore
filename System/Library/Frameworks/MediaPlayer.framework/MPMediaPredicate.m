@implementation MPMediaPredicate

- (MPMediaPredicate)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("MPMediaPredicate is an abstract class and cannot be decoded."));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C78], CFSTR("MPMediaPredicate is an abstract class and cannot be encoded."));
}

- (MPMediaPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C78], CFSTR("MPMediaPredicate is an abstract class and cannot be decoded."));

  return 0;
}

- (MPMediaPredicate)initWithProtobufferDecodableObject:(id)a3
{
  return -[MPMediaPredicate initWithProtobufferDecodableObject:library:](self, "initWithProtobufferDecodableObject:library:", a3, 0);
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C78], CFSTR("MPMediaPredicate is an abstract class and cannot be encoded."));
  return 0;
}

- (id)protobufferEncodableObject
{
  return -[MPMediaPredicate protobufferEncodableObjectFromLibrary:](self, "protobufferEncodableObjectFromLibrary:", 0);
}

- (BOOL)evaluateEntity:(id)a3
{
  void *v4;
  void *v5;
  MPMediaQuery *v6;
  void *v7;
  MPMediaQuery *v8;

  objc_msgSend(a3, "valueForKey:", CFSTR("persistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("persistentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [MPMediaQuery alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", self, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPMediaQuery initWithFilterPredicates:](v6, "initWithFilterPredicates:", v7);

  LOBYTE(v7) = -[MPMediaQuery _hasItems](v8, "_hasItems");
  return (char)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
