@implementation AEAssessmentAgentService

+ (id)registerRestrictionEnforcer:(id)a3 machServiceName:(id)a4
{
  id v5;
  id v6;
  id *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AEAssessmentModeRestrictionEnforcementSession initWithRestrictionEnforcer:machServiceName:]((id *)[AEAssessmentModeRestrictionEnforcementSession alloc], v6, v5);

  return v7;
}

@end
