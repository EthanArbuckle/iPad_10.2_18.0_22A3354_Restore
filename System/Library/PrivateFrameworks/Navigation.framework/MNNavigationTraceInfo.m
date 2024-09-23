@implementation MNNavigationTraceInfo

- (NSString)pedestrianTracePath
{
  return self->_pedestrianTracePath;
}

- (void)setPedestrianTracePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)pedestrianTraceStartRelativeTimestamp
{
  return self->_pedestrianTraceStartRelativeTimestamp;
}

- (void)setPedestrianTraceStartRelativeTimestamp:(double)a3
{
  self->_pedestrianTraceStartRelativeTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pedestrianTracePath, 0);
}

@end
