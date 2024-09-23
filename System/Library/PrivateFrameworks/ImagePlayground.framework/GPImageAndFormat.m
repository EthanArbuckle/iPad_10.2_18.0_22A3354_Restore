@implementation GPImageAndFormat

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  GPImageAndFormat *v5;

  v4 = a3;
  v5 = self;
  ImageAndFormat.encode(with:)((NSCoder)v4);

}

- (GPImageAndFormat)initWithCoder:(id)a3
{
  return (GPImageAndFormat *)ImageAndFormat.init(coder:)(a3);
}

- (GPImageAndFormat)init
{
  GPImageAndFormat *result;

  result = (GPImageAndFormat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_23ED04528(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___GPImageAndFormat_data), *(_QWORD *)&self->format[OBJC_IVAR___GPImageAndFormat_data]);
}

@end
