@implementation XPCThumbnailConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCThumbnailConfiguration)initWithCoder:(id)a3
{
  XPCThumbnailConfiguration *v4;

  swift_getObjectType();
  v4 = (XPCThumbnailConfiguration *)sub_23316A838(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCThumbnailConfiguration *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit22ThumbnailConfigurationV3XPCC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCThumbnailConfiguration)init
{
  XPCThumbnailConfiguration *result;

  result = (XPCThumbnailConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
