@implementation ACCNavigationShimAccessory

- (ACCNavigationShimAccessory)init
{
  ACCNavigationShimAccessory *v2;
  ACCNavigationShimAccessory *v3;
  ACCiAP2ShimAccessory *iap2ShimAccessory;
  ACCNavigationAccessory *navigationAccessory;
  dispatch_queue_t v6;
  OS_dispatch_queue *processingQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACCNavigationShimAccessory;
  v2 = -[ACCNavigationShimAccessory init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    iap2ShimAccessory = v2->_iap2ShimAccessory;
    v2->_iap2ShimAccessory = 0;

    navigationAccessory = v3->_navigationAccessory;
    v3->_navigationAccessory = 0;

    v6 = dispatch_queue_create("com.apple.accNavigation.NavigationProcessingQueue", 0);
    processingQueue = v3->_processingQueue;
    v3->_processingQueue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

- (void)dealloc
{
  ACCiAP2ShimAccessory *iap2ShimAccessory;
  ACCNavigationAccessory *navigationAccessory;
  OS_dispatch_queue *processingQueue;
  objc_super v6;

  iap2ShimAccessory = self->_iap2ShimAccessory;
  self->_iap2ShimAccessory = 0;

  navigationAccessory = self->_navigationAccessory;
  self->_navigationAccessory = 0;

  processingQueue = self->_processingQueue;
  self->_processingQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationShimAccessory;
  -[ACCNavigationShimAccessory dealloc](&v6, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCNavigationShimAccessory>[iap2ShimAccessory=%@; navigationAccessory=%@]"),
               self->_iap2ShimAccessory,
               self->_navigationAccessory);
}

- (id)create_xpc_representation
{
  BOOL v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  xpc_object_t v14;
  id v15;
  xpc_object_t xdict;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACCNavigationShimAccessory create_xpc_representation].cold.1();

  v6 = -[ACCiAP2ShimAccessory connectionID](self->_iap2ShimAccessory, "connectionID");
  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(xdict, "identifier", v6);
  v7 = xpc_array_create(0, 0);
  -[ACCNavigationAccessory componentList](self->_navigationAccessory, "componentList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v8, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), xdict);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v14, "isEnabled", objc_msgSend(v13, "isEnabled"));
        xpc_dictionary_set_uint64(v14, "identifier", objc_msgSend(v13, "identifier"));
        objc_msgSend(v13, "name");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_dictionary_set_string(v14, "name", (const char *)objc_msgSend(v15, "cStringUsingEncoding:", 4));

        xpc_dictionary_set_uint64(v14, "maxLength_CurrentRoadName", objc_msgSend(v13, "maxLength_CurrentRoadName"));
        xpc_dictionary_set_uint64(v14, "maxLength_DestinationRoadName", objc_msgSend(v13, "maxLength_DestinationRoadName"));
        xpc_dictionary_set_uint64(v14, "maxLength_PostManeuverRoadName", objc_msgSend(v13, "maxLength_PostManeuverRoadName"));
        xpc_dictionary_set_uint64(v14, "maxLength_ManeuverDescription", objc_msgSend(v13, "maxLength_ManeuverDescription"));
        xpc_dictionary_set_uint64(v14, "maxCapacity_GuidanceManeuver", objc_msgSend(v13, "maxCapacity_GuidanceManeuver"));
        xpc_dictionary_set_uint64(v14, "maxLength_LaneGuidanceDescription", objc_msgSend(v13, "maxLength_LaneGuidanceDescription"));
        xpc_dictionary_set_uint64(v14, "maxCapacity_LaneGuidance", objc_msgSend(v13, "maxCapacity_LaneGuidance"));
        xpc_dictionary_set_uint64(v14, "requestSourceName", objc_msgSend(v13, "requestSourceName"));
        xpc_dictionary_set_uint64(v14, "requestSourceSupportsRouteGuidance", objc_msgSend(v13, "requestSourceSupportsRouteGuidance"));
        xpc_dictionary_set_uint64(v14, "supportsExitInfo", objc_msgSend(v13, "supportsExitInfo"));
        xpc_array_append_value(v7, v14);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  xpc_dictionary_set_value(xdict, "components", v7);
  return xdict;
}

- (ACCiAP2ShimAccessory)iap2ShimAccessory
{
  return self->_iap2ShimAccessory;
}

- (void)setIap2ShimAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_iap2ShimAccessory, a3);
}

- (ACCNavigationAccessory)navigationAccessory
{
  return self->_navigationAccessory;
}

- (void)setNavigationAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_navigationAccessory, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProcessingQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_navigationAccessory, 0);
  objc_storeStrong((id *)&self->_iap2ShimAccessory, 0);
}

- (void)create_xpc_representation
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_215D92000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
