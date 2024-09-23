@implementation ARSCNVisualizationHelper

+ (id)createMaterialWithTexture:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CD59C0];
  v4 = a3;
  objc_msgSend(v3, "material");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "diffuse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContents:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ambient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContents:", v7);

  objc_msgSend(v5, "setLightingModelName:", *MEMORY[0x1E0CD5AF8]);
  objc_msgSend(v5, "setLocksAmbientWithDiffuse:", 1);
  return v5;
}

+ (id)createAxesNode:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  float v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARSCNVisualizationHelper createMaterialWithTexture:](ARSCNVisualizationHelper, "createMaterialWithTexture:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD5958], "boxWithWidth:height:length:chamferRadius:", a3, a3 / 50.0, a3 / 50.0, a3 / 50.0 * 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaterials:", v6);

  objc_msgSend(MEMORY[0x1E0CD59D0], "nodeWithGeometry:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3 * 0.5;
  v9 = a3 * 0.5;
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  *(float *)&v8 = v9;
  objc_msgSend(v7, "setPosition:", v8, v10, v11);
  objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARSCNVisualizationHelper createMaterialWithTexture:](ARSCNVisualizationHelper, "createMaterialWithTexture:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD5958], "boxWithWidth:height:length:chamferRadius:", a3 / 50.0, a3, a3 / 50.0, a3 / 50.0 * 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMaterials:", v15);

  objc_msgSend(MEMORY[0x1E0CD59D0], "nodeWithGeometry:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 0;
  LODWORD(v18) = 0;
  *(float *)&v19 = v9;
  objc_msgSend(v16, "setPosition:", v17, v19, v18);
  objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARSCNVisualizationHelper createMaterialWithTexture:](ARSCNVisualizationHelper, "createMaterialWithTexture:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD5958], "boxWithWidth:height:length:chamferRadius:", a3 / 50.0, a3 / 50.0, a3, a3 / 50.0 * 0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMaterials:", v23);

  objc_msgSend(MEMORY[0x1E0CD59D0], "nodeWithGeometry:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 0;
  LODWORD(v26) = 0;
  *(float *)&v27 = v9;
  objc_msgSend(v24, "setPosition:", v25, v26, v27);
  objc_msgSend(MEMORY[0x1E0CD59D0], "node");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addChildNode:", v7);
  objc_msgSend(v28, "addChildNode:", v16);
  objc_msgSend(v28, "addChildNode:", v24);

  return v28;
}

+ (id)createGeometryForPointCloud:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  v4 = a3;
  objc_msgSend(v3, "dataWithBytes:length:", objc_msgSend(v4, "points"), 16 * objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD5988], "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v5, *MEMORY[0x1E0CD5A88], objc_msgSend(v4, "count"), 1, 3, 4, 0, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CD5980];
  v8 = objc_msgSend(v4, "count");

  objc_msgSend(v7, "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", 0, 3, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPointSize:", 0.001);
  objc_msgSend(v9, "setMinimumPointScreenSpaceRadius:", 8.0);
  objc_msgSend(v9, "setMaximumPointScreenSpaceRadius:", 72.0);
  v10 = (void *)MEMORY[0x1E0CD5978];
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "geometryWithSources:elements:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.800000012, 0.0, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARSCNVisualizationHelper createMaterialWithTexture:](ARSCNVisualizationHelper, "createMaterialWithTexture:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFirstMaterial:", v15);

  return v13;
}

@end
