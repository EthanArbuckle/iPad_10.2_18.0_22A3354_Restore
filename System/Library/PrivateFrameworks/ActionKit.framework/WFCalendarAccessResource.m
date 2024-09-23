@implementation WFCalendarAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.mobilecal");
}

- (unint64_t)status
{
  return 4;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  WFClearWorkflowEventStore();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__WFCalendarAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v7[3] = &unk_24F8BB5E0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __77__WFCalendarAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithForcedNotification");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
