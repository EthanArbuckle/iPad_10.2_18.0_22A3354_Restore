@implementation GPImageFormat

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  GPImageFormat *v5;

  v4 = a3;
  v5 = self;
  ImageFormat.encode(with:)((NSCoder)v4);

}

- (GPImageFormat)initWithCoder:(id)a3
{
  id v3;
  GPImageFormat *v4;

  v3 = a3;
  v4 = (GPImageFormat *)sub_23ED33504(v3);

  return v4;
}

- (GPImageFormat)init
{
  GPImageFormat *result;

  result = (GPImageFormat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
