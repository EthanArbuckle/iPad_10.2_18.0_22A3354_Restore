@implementation CRSequenceEncoder

- (BOOL)setStorage:(id)a3 error:(id *)a4
{
  _TtC9Coherence17CRSequenceEncoder *v5;
  _BYTE v7[32];

  swift_unknownObjectRetain();
  v5 = self;
  sub_1BE1B2F3C();
  swift_unknownObjectRelease();
  sub_1BDF0A878((uint64_t)v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);

  return 1;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
