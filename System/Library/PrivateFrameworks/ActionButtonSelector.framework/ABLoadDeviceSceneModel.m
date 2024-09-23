@implementation ABLoadDeviceSceneModel

void __ABLoadDeviceSceneModel_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "childNodeWithName:recursively:", a2, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstMaterial");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "normal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntensity:", 0.2);

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "diffuse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v6);

  objc_msgSend(v4, "roughness");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIntensity:", 0.65);

}

@end
