@implementation CALayer

+ (id)buddy_layerForPackageWithData:(id)a3 geometryFlipped:(BOOL)a4 scale:(double)a5
{
  CAPackage *v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  id v11;
  id v12;
  CATransform3D v14;
  CATransform3D v15;
  os_log_type_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  BOOL v22;
  id location[3];
  uint8_t buf[24];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = a5;
  v20 = 0;
  v18 = 0;
  v7 = +[CAPackage packageWithData:type:options:error:](CAPackage, "packageWithData:type:options:error:", location[0], kCAPackageTypeArchive, 0, &v18);
  objc_storeStrong(&v20, v18);
  v19 = v7;
  if (v20)
  {
    v17 = (id)_BYLoggingFacility(v8);
    v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)v20);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v17, v16, "Failed to load package data with error %@", buf, 0xCu);
    }
    objc_storeStrong(&v17, 0);
  }
  v9 = v22;
  v10 = objc_msgSend(v19, "rootLayer");
  objc_msgSend(v10, "setGeometryFlipped:", v9);

  CATransform3DMakeScale(&v15, 1.0 / v21, 1.0 / v21, 1.0);
  v11 = objc_msgSend(v19, "rootLayer");
  v14 = v15;
  objc_msgSend(v11, "setTransform:", &v14);

  v12 = objc_msgSend(v19, "rootLayer");
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v12;
}

@end
