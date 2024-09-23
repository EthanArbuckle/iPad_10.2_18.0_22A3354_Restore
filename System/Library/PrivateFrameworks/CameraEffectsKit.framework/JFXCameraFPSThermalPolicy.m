@implementation JFXCameraFPSThermalPolicy

- (unint64_t)priority
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__JFXCameraFPSThermalPolicy_priority__block_invoke;
  v4[3] = &unk_24EE57B88;
  v4[4] = self;
  v4[5] = &v5;
  +[JFXThermalMonitor enumerateThermalPressureLevel:](JFXThermalMonitor, "enumerateThermalPressureLevel:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__JFXCameraFPSThermalPolicy_priority__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "cameraFPSForThermalLevel:deviceType:minRate:maxRate:", a2, 0, (char *)&v4 + 4, &v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += (int)v4;
  return result;
}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (Priority %lu):"), v4, -[JFXCameraFPSThermalPolicy priority](self, "priority"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__JFXCameraFPSThermalPolicy_description__block_invoke;
  v7[3] = &unk_24EE57B88;
  v7[4] = self;
  v7[5] = &v8;
  +[JFXThermalMonitor enumerateThermalPressureLevel:](JFXThermalMonitor, "enumerateThermalPressureLevel:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __40__JFXCameraFPSThermalPolicy_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;

  v11 = 0;
  v10 = 0;
  objc_msgSend(*(id *)(a1 + 32), "cameraFPSForThermalLevel:deviceType:minRate:maxRate:", a2, 0, &v11, &v10);
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  +[JFXThermalMonitor stringFromThermalPressureLevel:](JFXThermalMonitor, "stringFromThermalPressureLevel:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ [ %d - %d ]"), v5, v6, v11, v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6
{
  *a6 = 30;
  *a5 = 30;
}

@end
