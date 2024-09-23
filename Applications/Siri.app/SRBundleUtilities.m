@implementation SRBundleUtilities

+ (id)getSiriAppBundle
{
  id v2;
  uint64_t ObjectType;
  uint64_t ObjCClassFromMetadata;

  v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SRBundleLookupClass()), "init");
  ObjectType = swift_getObjectType(v2);

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(ObjectType);
  return objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
}

- (_TtC4Siri17SRBundleUtilities)init
{
  uint64_t v2;

  return (_TtC4Siri17SRBundleUtilities *)sub_10007A694(self, (uint64_t)a2, v2, (uint64_t (*)(uint64_t))type metadata accessor for SRBundleUtilities);
}

@end
