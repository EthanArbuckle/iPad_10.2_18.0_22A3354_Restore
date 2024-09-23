@implementation CBDigitizerHotspotTTF

- (CBDigitizerHotspotTTF)init
{
  NSMutableArray *v2;
  objc_super v4;
  SEL v5;
  CBDigitizerHotspotTTF *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CBDigitizerHotspotTTF;
  v6 = -[CBDigitizerHotspot init](&v4, sel_init);
  if (v6)
  {
    v2 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6->_buffer = v2;
    v6->_touchBufferWindowS = 10;
  }
  return v6;
}

- (id)description
{
  float v2;
  id v4;
  unint64_t touchBufferWindowS;
  uint64_t v6;
  id v7;
  objc_super v8;
  SEL v9;
  CBDigitizerHotspotTTF *v10;

  v10 = self;
  v9 = a2;
  v7 = (id)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CBDigitizerHotspotTTF;
  v4 = -[CBDigitizerHotspot description](&v8, sel_description);
  touchBufferWindowS = v10->_touchBufferWindowS;
  v6 = -[NSMutableArray count](v10->_buffer, "count");
  -[CBDigitizerHotspot touchTriggerDelay](v10, "touchTriggerDelay");
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ window=%lu count=%lu backoff=%.1f"), v4, touchBufferWindowS, v6, v2);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBDigitizerHotspotTTF *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBDigitizerHotspotTTF;
  -[CBDigitizerHotspotTTF dealloc](&v2, sel_dealloc);
}

- (float)computeBackoff:(float)a3
{
  NSMutableArray *buffer;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  BOOL (*v9)(uint64_t, void *, uint64_t);
  void *v10;
  CBDigitizerHotspotTTF *v11;
  float v12;
  uint64_t v13;
  float v14;
  SEL v15;
  CBDigitizerHotspotTTF *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = 0;
  buffer = self->_buffer;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __40__CBDigitizerHotspotTTF_computeBackoff___block_invoke;
  v10 = &unk_1E68EBC28;
  v12 = a3;
  v11 = v16;
  v13 = -[NSMutableArray indexesOfObjectsWithOptions:passingTest:](buffer, "indexesOfObjectsWithOptions:passingTest:", 2, &v6);
  -[NSMutableArray removeObjectsAtIndexes:](v16->_buffer, "removeObjectsAtIndexes:", v13);
  v5 = -[NSMutableArray count](v16->_buffer, "count");
  if (!v5)
    return 0.0;
  if ((float)v5 >= 3.0)
    return (float)((float)((float)v5 - 3.0) + 1.0) + 5.0;
  return 5.0;
}

BOOL __40__CBDigitizerHotspotTTF_computeBackoff___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  float v3;
  float v6;
  BOOL v7;

  v6 = *(float *)(a1 + 40);
  objc_msgSend(a2, "floatValue");
  v7 = 1;
  if (fabs((float)(v6 - v3)) <= 10.0)
    return (unint64_t)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") - 1 - a3) > 6;
  return v7;
}

- (void)setTouchReleaseTime:(float)a3
{
  double v3;
  double v4;
  objc_super v5;
  float v6;
  SEL v7;
  CBDigitizerHotspotTTF *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  -[NSMutableArray addObject:](self->_buffer, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&a3));
  *(float *)&v3 = v6;
  v5.receiver = v8;
  v5.super_class = (Class)CBDigitizerHotspotTTF;
  -[CBDigitizerHotspot setTouchReleaseTime:](&v5, sel_setTouchReleaseTime_, v3);
  *(float *)&v4 = v6;
  -[CBDigitizerHotspotTTF computeBackoff:](v8, "computeBackoff:", v4);
  -[CBDigitizerHotspot setTouchTriggerDelay:](v8, "setTouchTriggerDelay:");
}

- (unint64_t)touchBufferWindowS
{
  return self->_touchBufferWindowS;
}

- (void)setTouchBufferWindowS:(unint64_t)a3
{
  self->_touchBufferWindowS = a3;
}

@end
