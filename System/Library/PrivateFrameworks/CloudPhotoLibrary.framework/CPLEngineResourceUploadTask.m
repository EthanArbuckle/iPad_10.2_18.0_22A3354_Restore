@implementation CPLEngineResourceUploadTask

- (CPLResource)cloudResource
{
  return self->_cloudResource;
}

- (void)setCloudResource:(id)a3
{
  objc_storeStrong((id *)&self->_cloudResource, a3);
}

- (BOOL)isBackgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(BOOL)a3
{
  self->_backgroundTask = a3;
}

- (CPLEngineTransportTask)transportTask
{
  return self->_transportTask;
}

- (void)setTransportTask:(id)a3
{
  objc_storeStrong((id *)&self->_transportTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportTask, 0);
  objc_storeStrong((id *)&self->_cloudResource, 0);
}

@end
