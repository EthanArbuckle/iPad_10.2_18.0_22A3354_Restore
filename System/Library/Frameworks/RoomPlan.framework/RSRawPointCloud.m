@implementation RSRawPointCloud

- (int64_t)count
{
  return *(_QWORD *)self->count;
}

- (void)setCount:(int64_t)a3
{
  *(_QWORD *)self->count = a3;
}

- (uint64_t)points
{
  return *(_QWORD *)(a1 + 24);
}

- (void)setPoints:(_TtC8RoomPlan15RSRawPointCloud *)self
{
  uint64_t v2;

  *(_QWORD *)self->points = v2;
}

@end
