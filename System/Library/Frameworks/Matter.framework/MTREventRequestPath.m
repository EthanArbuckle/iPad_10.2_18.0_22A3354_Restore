@implementation MTREventRequestPath

- (MTREventRequestPath)initWithEndpointID:(id)a3 clusterID:(id)a4 eventID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSNumber *v13;
  NSNumber *endpoint;
  const char *v15;
  uint64_t v16;
  NSNumber *v17;
  NSNumber *cluster;
  const char *v19;
  uint64_t v20;
  NSNumber *v21;
  NSNumber *event;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = (NSNumber *)objc_msgSend_copy(v8, v11, v12);
  endpoint = self->_endpoint;
  self->_endpoint = v13;

  v17 = (NSNumber *)objc_msgSend_copy(v9, v15, v16);
  cluster = self->_cluster;
  self->_cluster = v17;

  v21 = (NSNumber *)objc_msgSend_copy(v10, v19, v20);
  event = self->_event;
  self->_event = v21;

  return self;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  unsigned int v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_unsignedShortValue(self->_endpoint, a2, v2);
  v8 = objc_msgSend_unsignedLongValue(self->_cluster, v6, v7);
  v11 = objc_msgSend_unsignedLongValue(self->_event, v9, v10);
  return (id)objc_msgSend_stringWithFormat_(v4, v12, (uint64_t)CFSTR("<MTREventRequestPath endpoint %u cluster %u event %u>"), v5, v8, v11);
}

+ (MTREventRequestPath)requestPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID
{
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  MTREventRequestPath *v10;
  const char *v11;
  void *v12;

  v7 = endpointID;
  v8 = clusterID;
  v9 = eventID;
  v10 = [MTREventRequestPath alloc];
  v12 = (void *)objc_msgSend_initWithEndpointID_clusterID_eventID_(v10, v11, (uint64_t)v7, v8, v9);

  return (MTREventRequestPath *)v12;
}

- (BOOL)isEqualToEventRequestPath:(id)a3
{
  id v4;
  NSNumber *endpoint;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSNumber *cluster;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSNumber *event;
  void *v16;
  char v17;

  v4 = a3;
  endpoint = self->_endpoint;
  objc_msgSend_endpoint(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_233BF4AA0(endpoint, v8))
  {
    cluster = self->_cluster;
    objc_msgSend_cluster(v4, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (sub_233BF4AA0(cluster, v12))
    {
      event = self->_event;
      objc_msgSend_event(v4, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = sub_233BF4AA0(event, v16);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  char isEqualToEventRequestPath;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    isEqualToEventRequestPath = objc_msgSend_isEqualToEventRequestPath_(self, v6, (uint64_t)v4);
  else
    isEqualToEventRequestPath = 0;

  return isEqualToEventRequestPath;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_unsignedShortValue(self->_endpoint, a2, v2);
  v7 = objc_msgSend_unsignedLongValue(self->_cluster, v5, v6);
  return v7 ^ objc_msgSend_unsignedLongValue(self->_event, v8, v9) ^ v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend_requestPathWithEndpointID_clusterID_eventID_(MTREventRequestPath, a2, (uint64_t)self->_endpoint, self->_cluster, self->_event);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)convertToEventPathParams:(EventPathParams *)a3
{
  NSNumber *endpoint;
  unsigned __int16 v6;
  NSNumber *cluster;
  unsigned int v8;
  NSNumber *event;
  unsigned int v10;

  endpoint = self->_endpoint;
  if (endpoint)
    v6 = objc_msgSend_unsignedShortValue(endpoint, a2, (uint64_t)a3);
  else
    v6 = -1;
  a3->var2 = v6;
  cluster = self->_cluster;
  if (cluster)
    v8 = objc_msgSend_unsignedLongValue(cluster, a2, (uint64_t)a3);
  else
    v8 = -1;
  a3->var0 = v8;
  event = self->_event;
  if (event)
    v10 = objc_msgSend_unsignedLongValue(event, a2, (uint64_t)a3);
  else
    v10 = -1;
  a3->var1 = v10;
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (NSNumber)cluster
{
  return self->_cluster;
}

- (NSNumber)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
