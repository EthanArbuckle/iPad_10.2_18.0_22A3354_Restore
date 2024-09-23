@implementation PHSignpostEventsEnabled

void __PHSignpostEventsEnabled_block_invoke()
{
  char *v0;
  id v1;

  v0 = getenv("PH_ENABLE_IMAGE_MANAGER_EVENTS");
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    PHSignpostEventsEnabled_eventsEnabled = objc_msgSend(v1, "BOOLValue");

  }
}

@end
