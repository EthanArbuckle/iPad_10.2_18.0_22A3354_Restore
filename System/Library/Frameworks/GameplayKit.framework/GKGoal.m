@implementation GKGoal

- (GKGoal)init
{
  GKGoal *v2;
  GKGoal *v3;
  GKPath *path;
  NSArray *obstacles;
  NSArray *agents;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKGoal;
  v2 = -[GKGoal init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    path = v2->_path;
    v2->_path = 0;

    obstacles = v3->_obstacles;
    v3->_obstacles = 0;

    agents = v3->_agents;
    v3->_agents = 0;

  }
  return v3;
}

+ (GKGoal)goalToSeekAgent:(GKAgent *)agent
{
  GKAgent *v3;
  id v4;

  v3 = agent;
  v4 = -[GKGoal initToSeekAgent:]([GKGoal alloc], "initToSeekAgent:", v3);

  return (GKGoal *)v4;
}

- (id)initToSeekAgent:(id)a3
{
  id v4;
  GKGoal *v5;
  GKGoal *v6;
  uint64_t v7;
  NSArray *agents;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKGoal;
  v5 = -[GKGoal init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 1;
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    agents = v6->_agents;
    v6->_agents = (NSArray *)v7;

  }
  return v6;
}

+ (GKGoal)goalToFleeAgent:(GKAgent *)agent
{
  GKAgent *v3;
  id v4;

  v3 = agent;
  v4 = -[GKGoal initToFleeAgent:]([GKGoal alloc], "initToFleeAgent:", v3);

  return (GKGoal *)v4;
}

- (id)initToFleeAgent:(id)a3
{
  id v4;
  GKGoal *v5;
  GKGoal *v6;
  uint64_t v7;
  NSArray *agents;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKGoal;
  v5 = -[GKGoal init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 2;
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    agents = v6->_agents;
    v6->_agents = (NSArray *)v7;

  }
  return v6;
}

+ (GKGoal)goalToAvoidObstacles:(NSArray *)obstacles maxPredictionTime:(NSTimeInterval)maxPredictionTime
{
  NSArray *v5;
  id v6;

  v5 = obstacles;
  v6 = -[GKGoal initToAvoidObstacles:maxPredictionTime:]([GKGoal alloc], "initToAvoidObstacles:maxPredictionTime:", v5, maxPredictionTime);

  return (GKGoal *)v6;
}

- (id)initToAvoidObstacles:(id)a3 maxPredictionTime:(double)a4
{
  id v7;
  GKGoal *v8;
  double *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGoal;
  v8 = -[GKGoal init](&v11, sel_init);
  v9 = (double *)v8;
  if (v8)
  {
    v8->_type = 3;
    objc_storeStrong((id *)&v8->_obstacles, a3);
    v9[5] = a4;
  }

  return v9;
}

+ (GKGoal)goalToAvoidAgents:(NSArray *)agents maxPredictionTime:(NSTimeInterval)maxPredictionTime
{
  NSArray *v5;
  id v6;

  v5 = agents;
  v6 = -[GKGoal initToAvoidAgents:maxPredictionTime:]([GKGoal alloc], "initToAvoidAgents:maxPredictionTime:", v5, maxPredictionTime);

  return (GKGoal *)v6;
}

- (id)initToAvoidAgents:(id)a3 maxPredictionTime:(double)a4
{
  id v7;
  GKGoal *v8;
  double *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGoal;
  v8 = -[GKGoal init](&v11, sel_init);
  v9 = (double *)v8;
  if (v8)
  {
    v8->_type = 4;
    objc_storeStrong((id *)&v8->_agents, a3);
    v9[5] = a4;
  }

  return v9;
}

+ (GKGoal)goalToSeparateFromAgents:(NSArray *)agents maxDistance:(float)maxDistance maxAngle:(float)maxAngle
{
  NSArray *v7;
  GKGoal *v8;
  double v9;
  double v10;
  id v11;

  v7 = agents;
  v8 = [GKGoal alloc];
  *(float *)&v9 = maxDistance;
  *(float *)&v10 = maxAngle;
  v11 = -[GKGoal initToSeparateFromAgents:maxDistance:maxAngle:](v8, "initToSeparateFromAgents:maxDistance:maxAngle:", v7, v9, v10);

  return (GKGoal *)v11;
}

- (id)initToSeparateFromAgents:(id)a3 maxDistance:(float)a4 maxAngle:(float)a5
{
  id v9;
  GKGoal *v10;
  float *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKGoal;
  v10 = -[GKGoal init](&v13, sel_init);
  v11 = (float *)v10;
  if (v10)
  {
    v10->_type = 5;
    objc_storeStrong((id *)&v10->_agents, a3);
    v11[12] = a5;
    v11[13] = a4;
  }

  return v11;
}

+ (GKGoal)goalToAlignWithAgents:(NSArray *)agents maxDistance:(float)maxDistance maxAngle:(float)maxAngle
{
  NSArray *v7;
  GKGoal *v8;
  double v9;
  double v10;
  id v11;

  v7 = agents;
  v8 = [GKGoal alloc];
  *(float *)&v9 = maxDistance;
  *(float *)&v10 = maxAngle;
  v11 = -[GKGoal initToAlignWithAgents:maxDistance:maxAngle:](v8, "initToAlignWithAgents:maxDistance:maxAngle:", v7, v9, v10);

  return (GKGoal *)v11;
}

- (id)initToAlignWithAgents:(id)a3 maxDistance:(float)a4 maxAngle:(float)a5
{
  id v9;
  GKGoal *v10;
  float *v11;
  float v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKGoal;
  v10 = -[GKGoal init](&v14, sel_init);
  v11 = (float *)v10;
  if (v10)
  {
    v10->_type = 6;
    objc_storeStrong((id *)&v10->_agents, a3);
    v12 = fabsf(a5);
    if (v12 > 3.14159265)
      v12 = 3.1416;
    v11[12] = v12;
    v11[13] = a4;
  }

  return v11;
}

+ (GKGoal)goalToCohereWithAgents:(NSArray *)agents maxDistance:(float)maxDistance maxAngle:(float)maxAngle
{
  NSArray *v7;
  GKGoal *v8;
  double v9;
  double v10;
  id v11;

  v7 = agents;
  v8 = [GKGoal alloc];
  *(float *)&v9 = maxDistance;
  *(float *)&v10 = maxAngle;
  v11 = -[GKGoal initToCohereWithAgents:maxDistance:maxAngle:](v8, "initToCohereWithAgents:maxDistance:maxAngle:", v7, v9, v10);

  return (GKGoal *)v11;
}

- (id)initToCohereWithAgents:(id)a3 maxDistance:(float)a4 maxAngle:(float)a5
{
  id v9;
  GKGoal *v10;
  float *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKGoal;
  v10 = -[GKGoal init](&v13, sel_init);
  v11 = (float *)v10;
  if (v10)
  {
    v10->_type = 7;
    objc_storeStrong((id *)&v10->_agents, a3);
    v11[12] = a5;
    v11[13] = a4;
  }

  return v11;
}

+ (GKGoal)goalToReachTargetSpeed:(float)targetSpeed
{
  GKGoal *v4;
  double v5;

  v4 = [GKGoal alloc];
  *(float *)&v5 = targetSpeed;
  return (GKGoal *)-[GKGoal initToReachTargetSpeed:](v4, "initToReachTargetSpeed:", v5);
}

- (id)initToReachTargetSpeed:(float)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKGoal;
  result = -[GKGoal init](&v5, sel_init);
  if (result)
  {
    *((_DWORD *)result + 2) = 8;
    *((float *)result + 14) = a3;
  }
  return result;
}

+ (GKGoal)goalToWander:(float)speed
{
  GKGoal *v4;
  double v5;

  v4 = [GKGoal alloc];
  *(float *)&v5 = speed;
  return (GKGoal *)-[GKGoal initToWander:](v4, "initToWander:", v5);
}

- (id)initToWander:(float)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKGoal;
  result = -[GKGoal init](&v5, sel_init);
  if (result)
  {
    *((_DWORD *)result + 2) = 9;
    *((float *)result + 14) = a3;
  }
  return result;
}

+ (GKGoal)goalToInterceptAgent:(GKAgent *)target maxPredictionTime:(NSTimeInterval)maxPredictionTime
{
  GKAgent *v5;
  id v6;

  v5 = target;
  v6 = -[GKGoal initToInterceptAgent:maxPredictionTime:]([GKGoal alloc], "initToInterceptAgent:maxPredictionTime:", v5, maxPredictionTime);

  return (GKGoal *)v6;
}

- (id)initToInterceptAgent:(id)a3 maxPredictionTime:(double)a4
{
  id v6;
  GKGoal *v7;
  GKGoal *v8;
  uint64_t v9;
  NSArray *agents;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKGoal;
  v7 = -[GKGoal init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = 10;
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    agents = v8->_agents;
    v8->_agents = (NSArray *)v9;

    v8->_time = a4;
  }

  return v8;
}

+ (GKGoal)goalToFollowPath:(GKPath *)path maxPredictionTime:(NSTimeInterval)maxPredictionTime forward:(BOOL)forward
{
  _BOOL8 v5;
  GKPath *v7;
  id v8;

  v5 = forward;
  v7 = path;
  v8 = -[GKGoal initToFollowPath:maxPredictionTime:forward:]([GKGoal alloc], "initToFollowPath:maxPredictionTime:forward:", v7, v5, maxPredictionTime);

  return (GKGoal *)v8;
}

- (id)initToFollowPath:(id)a3 maxPredictionTime:(double)a4 forward:(BOOL)a5
{
  id v9;
  GKGoal *v10;
  GKGoal *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKGoal;
  v10 = -[GKGoal init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = 11;
    objc_storeStrong((id *)&v10->_path, a3);
    v11->_time = a4;
    v11->_forward = a5;
  }

  return v11;
}

+ (GKGoal)goalToStayOnPath:(GKPath *)path maxPredictionTime:(NSTimeInterval)maxPredictionTime
{
  GKPath *v5;
  id v6;

  v5 = path;
  v6 = -[GKGoal initToStayOnPath:maxPredictionTime:]([GKGoal alloc], "initToStayOnPath:maxPredictionTime:", v5, maxPredictionTime);

  return (GKGoal *)v6;
}

- (id)initToStayOnPath:(id)a3 maxPredictionTime:(double)a4
{
  id v7;
  GKGoal *v8;
  double *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGoal;
  v8 = -[GKGoal init](&v11, sel_init);
  v9 = (double *)v8;
  if (v8)
  {
    v8->_type = 12;
    objc_storeStrong((id *)&v8->_path, a3);
    v9[5] = a4;
  }

  return v9;
}

- (__n128)getForce:(uint64_t)a3 agent:(void *)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  __int128 v16;

  v6 = a4;
  v9 = v6;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "position3");
      objc_msgSend(v9, "steerForSeek:");
      goto LABEL_10;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "position3");
      objc_msgSend(v9, "steerForFlee:");
LABEL_10:
      v16 = v11;

      goto LABEL_18;
    case 3:
      objc_msgSend(v6, "steerToAvoidObstacles:timeBeforeCollisionToAvoid:", *(_QWORD *)(a1 + 24), *(double *)(a1 + 40));
      goto LABEL_17;
    case 4:
      objc_msgSend(v6, "steerToAvoidAgents:timeBeforeCollisionToAvoid:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
      goto LABEL_17;
    case 5:
      LODWORD(v8) = *(_DWORD *)(a1 + 48);
      LODWORD(v7) = *(_DWORD *)(a1 + 52);
      objc_msgSend(v6, "steerForSeparation:maxDistance:maxAngle:", *(_QWORD *)(a1 + 32), v7, v8);
      goto LABEL_17;
    case 6:
      LODWORD(v8) = *(_DWORD *)(a1 + 48);
      LODWORD(v7) = *(_DWORD *)(a1 + 52);
      objc_msgSend(v6, "steerForAlignment:maxDistance:maxAngle:", *(_QWORD *)(a1 + 32), v7, v8);
      goto LABEL_17;
    case 7:
      LODWORD(v8) = *(_DWORD *)(a1 + 48);
      LODWORD(v7) = *(_DWORD *)(a1 + 52);
      objc_msgSend(v6, "steerForCohesion:maxDistance:maxAngle:", *(_QWORD *)(a1 + 32), v7, v8);
      goto LABEL_17;
    case 8:
      v16 = 0u;
      if (*(float *)(a1 + 56) <= 1.0)
        goto LABEL_18;
      objc_msgSend(v6, "steerForTargetSpeed:");
LABEL_17:
      v16 = v12;
LABEL_18:

      return (__n128)v16;
    case 9:
      LODWORD(v8) = *(_DWORD *)(a1 + 56);
      objc_msgSend(v6, "steerForWander:speed:", a2, v8);
      goto LABEL_17;
    case 0xA:
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "steerForIntercept:maxPredictionTime:", v13, *(double *)(a1 + 40));
      v16 = v14;

      goto LABEL_18;
    case 0xB:
      objc_msgSend(v6, "steerToFollowPath:maxPredictionTime:forward:", *(_QWORD *)(a1 + 16), *(unsigned __int8 *)(a1 + 60), *(double *)(a1 + 40));
      goto LABEL_17;
    case 0xC:
      objc_msgSend(v6, "steerToStayOnPath:maxPredictionTime:", *(_QWORD *)(a1 + 16), *(double *)(a1 + 40));
      goto LABEL_17;
    default:
      v12 = 0uLL;
      goto LABEL_17;
  }
}

- (id)copy
{
  return -[GKGoal copyWithZone:](self, "copyWithZone:", MEMORY[0x22E2A4F5C](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  GKGoal *v4;

  v4 = objc_alloc_init(GKGoal);
  v4->_type = self->_type;
  objc_storeStrong((id *)&v4->_path, self->_path);
  objc_storeStrong((id *)&v4->_obstacles, self->_obstacles);
  objc_storeStrong((id *)&v4->_agents, self->_agents);
  v4->_time = self->_time;
  v4->_angle = self->_angle;
  v4->_distance = self->_distance;
  v4->_speed = self->_speed;
  v4->_forward = self->_forward;
  return v4;
}

- (float)speed
{
  return self->_speed;
}

- (BOOL)isTargetSpeedGoal
{
  return self->_type == 8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agents, 0);
  objc_storeStrong((id *)&self->_obstacles, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
