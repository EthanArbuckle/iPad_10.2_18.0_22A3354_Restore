@implementation VideoUserAction

- (int64_t)type
{
  return *(_QWORD *)self->type;
}

- (void)setType:(int64_t)a3
{
  *(_QWORD *)self->type = a3;
}

- (MFTimeStamp)timeStamp
{
  return (MFTimeStamp *)(id)swift_unknownObjectRetain();
}

- (void)setTimeStamp:(id)a3
{
  *(_QWORD *)self->timeStamp = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int64_t)source
{
  return *(_QWORD *)self->source;
}

- (void)setSource:(int64_t)a3
{
  *(_QWORD *)self->source = a3;
}

@end
