@implementation HMDXPCActivityInterface

- (void)registerXPCActivityWithActivityIdentifier:(id)a3 criteria:(id)a4 activityBlock:(id)a5
{
  id v7;
  id v8;
  xpc_object_t criteria;

  v7 = objc_retainAutorelease(a3);
  v8 = a5;
  criteria = a4;
  xpc_activity_register((const char *)objc_msgSend(v7, "UTF8String"), criteria, v8);

}

- (id)criteriaForXPCActivity:(id)a3
{
  return xpc_activity_copy_criteria((xpc_activity_t)a3);
}

- (void)setCriteria:(id)a3 forXPCActivity:(id)a4
{
  xpc_activity_set_criteria((xpc_activity_t)a4, a3);
}

- (BOOL)setState:(int64_t)a3 forXPCActivity:(id)a4
{
  return xpc_activity_set_state((xpc_activity_t)a4, a3);
}

- (int64_t)stateForXPCActivity:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

- (void)unregisterXPCActivityWithActivityIdentifier:(id)a3
{
  xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

@end
