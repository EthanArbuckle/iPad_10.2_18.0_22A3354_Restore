@implementation SidecarProvider

- (SidecarRequest)activeRequest
{
  return (SidecarRequest *)*(id *)&self->activeRequest[7];
}

- (void)setActiveRequest:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->activeRequest[7];
  *(_QWORD *)&self->activeRequest[7] = a3;
  v3 = a3;

}

@end
