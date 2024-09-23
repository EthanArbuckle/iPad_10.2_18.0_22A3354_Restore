@implementation FollowerMetadata

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_timestamp);
}

- (void)setTimestamp:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_timestamp) = a3;
}

- (NSArray)observations
{
  return (NSArray *)sub_23A6852B8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_observations, (void (*)(void))type metadata accessor for DockCoreObservation);
}

- (void)setObservations:(id)a3
{
  sub_23A685324((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for DockCoreObservation, &OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_observations);
}

- (NSString)portType
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_portType));
}

- (void)setPortType:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_portType);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_portType) = (Class)a3;
  v3 = a3;

}

- (int)orientation
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_orientation);
}

- (void)setOrientation:(int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_orientation) = a3;
}

- (NSArray)intrinsics
{
  return (NSArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_intrinsics));
}

- (void)setIntrinsics:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_intrinsics);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_intrinsics) = (Class)a3;
  v3 = a3;

}

- (float)referenceWidth
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_referenceWidth);
}

- (void)setReferenceWidth:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_referenceWidth) = a3;
}

- (float)referenceHeight
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_referenceHeight);
}

- (void)setReferenceHeight:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_referenceHeight) = a3;
}

- (NSArray)focusObservation
{
  return (NSArray *)sub_23A6852B8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_focusObservation, (void (*)(void))type metadata accessor for DockKitFocusObservation);
}

- (void)setFocusObservation:(id)a3
{
  sub_23A685324((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for DockKitFocusObservation, &OBJC_IVAR____TtC11DockKitCore16FollowerMetadata_focusObservation);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore16FollowerMetadata)init
{
  return (_TtC11DockKitCore16FollowerMetadata *)FollowerMetadata.init()();
}

- (_TtC11DockKitCore16FollowerMetadata)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore16FollowerMetadata *v4;

  v3 = a3;
  v4 = (_TtC11DockKitCore16FollowerMetadata *)sub_23A688A2C(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore16FollowerMetadata *v5;

  v4 = a3;
  v5 = self;
  sub_23A68555C(v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
