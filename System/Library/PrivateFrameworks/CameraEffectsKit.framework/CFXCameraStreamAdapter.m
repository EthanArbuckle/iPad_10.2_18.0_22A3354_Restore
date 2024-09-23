@implementation CFXCameraStreamAdapter

+ (void)notifyExternalImageData:(id)a3 orientation:(int64_t)a4 effectComposition:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x24BDB14C0], "isSupported")
    && (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "jfx_hasTrueDepthFrontCamera"),
        v9,
        v10))
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v7, "cameraIntrinsics");
    objc_msgSend(v11, "setCameraIntrinsics:");
    objc_msgSend(v11, "setCameraPosition:", objc_msgSend(v7, "cameraPosition"));
    objc_msgSend(v7, "faceData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detectedFaces");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHasValidFaceData:", objc_msgSend(v13, "count") != 0);

    objc_msgSend(v11, "setOrientation:", a4);
    objc_msgSend(v11, "setPixelBuffer:", objc_msgSend(v7, "pixelBuffer"));
    objc_msgSend(v7, "timestamp");
    objc_msgSend(v11, "setTimestamp:");
    objc_msgSend(v11, "setRequiresFaceTracking:", objc_msgSend(v8, "requiresFaceTracking"));
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke;
    v40[3] = &unk_24EE57B60;
    v41 = v7;
    v14 = (void *)MEMORY[0x2276A1F6C](v40);
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "notifyExternalARKitFaceTrackedImageData:completion:", v11, v14);

  }
  else
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setPixelBuffer:", objc_msgSend(v7, "pixelBuffer"));
    objc_msgSend(v7, "timestamp");
    objc_msgSend(v11, "setTimestamp:");
    objc_msgSend(v11, "setCaptureFramesPerSecond:", objc_msgSend(v7, "captureFramesPerSecond"));
    objc_msgSend(v7, "cameraIntrinsics");
    objc_msgSend(v11, "setCameraIntrinsics:");
    objc_msgSend(v11, "setCameraPosition:", objc_msgSend(v7, "cameraPosition"));
    objc_msgSend(v7, "faceData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "detectedFaces");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHasValidFaceData:", objc_msgSend(v17, "count") != 0);

    objc_msgSend(v11, "setRequiresFaceTracking:", objc_msgSend(v8, "requiresFaceTracking"));
    objc_msgSend(v11, "setOrientation:", a4);
    objc_msgSend(v7, "faceData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "detectedFaces");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "faceTrackingEnabled");

      v22 = v21 ^ 1;
    }
    else
    {
      v22 = 1;
    }

    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "sessionRequiresFaceTracking") & 1) != 0)
      v24 = 0;
    else
      v24 = objc_msgSend(v8, "requiresFaceTracking") ^ 1;

    if (((v22 | v24) & 1) == 0)
    {
      objc_msgSend(v7, "faceData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "detectedFaces");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x24BDAC760];
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke_2;
      v38[3] = &unk_24EE58840;
      v29 = v27;
      v39 = v29;
      objc_msgSend(v26, "enumerateObjectsUsingBlock:", v38);
      +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "updateCurrentlyTrackedFaceID:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v36[0] = v28;
      v36[1] = 3221225472;
      v36[2] = __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke_3;
      v36[3] = &unk_24EE58868;
      v32 = v31;
      v37 = v32;
      v33 = objc_msgSend(v26, "indexOfObjectPassingTest:", v36);
      if (v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v26, "objectAtIndexedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "boundingBox");
        objc_msgSend(v11, "setNormalizedFaceRect:");
        objc_msgSend(v34, "rollAngleInDegrees");
        objc_msgSend(v11, "setRollAngle:");

      }
    }
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "notifyExternalImageData:completion:", v11, 0);

  }
}

void __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arCameraSessionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processExternalSensorData:", *(_QWORD *)(a1 + 32));

}

void __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "ID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

BOOL __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "ID");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "longLongValue");
}

@end
