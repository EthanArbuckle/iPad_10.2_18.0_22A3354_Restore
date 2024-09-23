@implementation CLPlacemark

- (void)dealloc
{
  CLPlacemarkInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)CLPlacemark;
  -[CLPlacemark dealloc](&v4, sel_dealloc);
}

+ (CLPlacemark)placemarkWithGEOMapItem:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  CLPlacemark *v11;
  const char *v12;
  uint64_t v13;

  if (objc_msgSend_isValid(a3, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_coordinate(a3, v5, v6, v7);
    v10 = 0;
    if (v9 >= -180.0 && v9 <= 180.0 && v8 <= 90.0 && v8 >= -90.0)
    {
      v11 = [CLPlacemark alloc];
      v10 = (void *)objc_msgSend__initWithGeoMapItem_(v11, v12, (uint64_t)a3, v13);
    }
  }
  else
  {
    v10 = 0;
  }
  return (CLPlacemark *)v10;
}

- (id)_initWithGeoMapItem:(id)a3
{
  CLPlacemark *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  CLCircularRegion *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CLLocation *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  objc_super v86;

  v86.receiver = self;
  v86.super_class = (Class)CLPlacemark;
  v4 = -[CLPlacemark init](&v86, sel_init);
  if (v4)
  {
    v4->_internal = objc_alloc_init(CLPlacemarkInternal);
    v7 = (void *)objc_msgSend_mapItemStorageForGEOMapItem_(MEMORY[0x1E0D271E8], v5, (uint64_t)a3, v6);
    v4->_internal->geoMapItemStorage = (GEOMapItemStorage *)objc_msgSend_copy(v7, v8, v9, v10);
    v14 = objc_msgSend_referenceFrame(a3, v11, v12, v13);
    if (v14 == 2)
      v18 = 2;
    else
      v18 = v14 == 1;
    v19 = (void *)objc_msgSend_geoFenceMapRegion(v4->_internal->geoMapItemStorage, v15, v16, v17);
    if (objc_msgSend_hasNorthLat(v19, v20, v21, v22)
      && objc_msgSend_hasSouthLat(v19, v23, v24, v25)
      && objc_msgSend_hasEastLng(v19, v23, v24, v25)
      && objc_msgSend_hasWestLng(v19, v23, v24, v25))
    {
      objc_msgSend_northLat(v19, v23, v24, v25);
      v27 = v26;
      objc_msgSend_southLat(v19, v28, v29, v30);
      v32 = v31;
      objc_msgSend_westLng(v19, v33, v34, v35);
      v37 = v36;
      objc_msgSend_eastLng(v19, v38, v39, v40);
      v45 = (v27 + v32) * 0.5;
      if (v37 <= v44)
      {
        v47 = (v37 + v44) * 0.5;
      }
      else
      {
        v46 = v37 + (v44 + 360.0 - v37) * 0.5;
        if (v46 <= 180.0)
          v47 = v46;
        else
          v47 = v46 + -360.0;
      }
      objc_msgSend_southLat(v19, v41, v42, v43);
      v49 = v48;
      objc_msgSend_westLng(v19, v50, v51, v52);
      v54 = sub_18F5BD12C(v45, v47, v49, v53);
      v55 = [CLCircularRegion alloc];
      v58 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v56, (uint64_t)CFSTR("<%+.8f,%+.8f> radius %.2f"), v57, *(_QWORD *)&v45, *(_QWORD *)&v47, *(_QWORD *)&v54);
      v4->_internal->region = (CLRegion *)objc_msgSend_initWithCenter_radius_identifier_(v55, v59, v58, v60, v45, v47, v54);
      objc_msgSend_setReferenceFrame_(v4->_internal->region, v61, v18, v62);
    }
    objc_msgSend_coordinate(v4->_internal->geoMapItemStorage, v23, v24, v25);
    v64 = v63;
    v66 = v65;
    v67 = [CLLocation alloc];
    v71 = objc_msgSend_date(MEMORY[0x1E0C99D68], v68, v69, v70);
    v4->_internal->location = (CLLocation *)objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_referenceFrame_(v67, v72, v71, v18, v64, v66, 0.0, 100.0, -1.0);
    v4->_internal->addressDictionary = (NSDictionary *)(id)objc_msgSend_addressDictionary(v4->_internal->geoMapItemStorage, v73, v74, v75);
    v4->_internal->areasOfInterest = (NSArray *)(id)objc_msgSend_areasOfInterest(v4->_internal->geoMapItemStorage, v76, v77, v78);
    v4->_internal->timeZone = (NSTimeZone *)(id)objc_msgSend_timezone(v4->_internal->geoMapItemStorage, v79, v80, v81);
    v4->_internal->category = (NSString *)(id)objc_msgSend__poiCategory(v4->_internal->geoMapItemStorage, v82, v83, v84);
  }
  return v4;
}

- (NSString)subAdministrativeArea
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("SubAdministrativeArea"), v2);
}

- (NSString)postalCode
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("ZIP"), v2);
}

- (NSString)locality
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("City"), v2);
}

- (NSString)administrativeArea
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("State"), v2);
}

- (NSString)ISOcountryCode
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("CountryCode"), v2);
}

- (CLLocation)location
{
  return self->_internal->location;
}

+ (unint64_t)_cLMapItemSourceFromRLMapItemSource:(unint64_t)a3
{
  unint64_t result;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;

  result = 0;
  if ((uint64_t)a3 > 511)
  {
    if (a3 == 0x8000)
      v4 = 0x8000;
    else
      v4 = 0;
    if (a3 == 0x4000)
      v4 = 0x4000;
    if (a3 == 0x2000)
      v5 = 0x2000;
    else
      v5 = 0;
    if (a3 == 4096)
      v5 = 4096;
    if ((uint64_t)a3 < 0x4000)
      v4 = v5;
    if (a3 == 2048)
      v6 = 2048;
    else
      v6 = 0;
    if (a3 == 1024)
      v6 = 1024;
    if (a3 == 512)
      v6 = 512;
    v7 = (uint64_t)a3 <= 4095;
  }
  else
  {
    if ((uint64_t)a3 <= 15)
    {
      switch(a3)
      {
        case 1uLL:
        case 2uLL:
        case 4uLL:
        case 8uLL:
          result = a3;
          break;
        default:
          return result;
      }
      return result;
    }
    if (a3 == 256)
      v4 = 256;
    else
      v4 = 0;
    if (a3 == 128)
      v4 = 128;
    if (a3 == 64)
      v6 = 64;
    else
      v6 = 0;
    if (a3 == 16)
      v6 = 16;
    v7 = (uint64_t)a3 <= 127;
  }
  if (v7)
    return v6;
  else
    return v4;
}

- (id)_initWithRTMapItem:(id)a3 location:(id)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;

  v7 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, (uint64_t)a3, (uint64_t)a4);
  v11 = objc_msgSend_name(a3, v8, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v12, v11, (uint64_t)CFSTR("Name"));
  v16 = (void *)objc_msgSend_address(a3, v13, v14, v15);
  v20 = objc_msgSend_thoroughfare(v16, v17, v18, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v21, v20, (uint64_t)CFSTR("Thoroughfare"));
  v25 = (void *)objc_msgSend_address(a3, v22, v23, v24);
  v29 = objc_msgSend_subThoroughfare(v25, v26, v27, v28);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v30, v29, (uint64_t)CFSTR("SubThoroughfare"));
  v34 = (void *)objc_msgSend_address(a3, v31, v32, v33);
  v38 = objc_msgSend_locality(v34, v35, v36, v37);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v39, v38, (uint64_t)CFSTR("City"));
  v43 = (void *)objc_msgSend_address(a3, v40, v41, v42);
  v47 = objc_msgSend_subLocality(v43, v44, v45, v46);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v48, v47, (uint64_t)CFSTR("SubLocality"));
  v52 = (void *)objc_msgSend_address(a3, v49, v50, v51);
  v56 = objc_msgSend_administrativeArea(v52, v53, v54, v55);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v57, v56, (uint64_t)CFSTR("State"));
  v61 = (void *)objc_msgSend_address(a3, v58, v59, v60);
  v65 = objc_msgSend_subAdministrativeArea(v61, v62, v63, v64);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v66, v65, (uint64_t)CFSTR("SubAdministrativeArea"));
  v70 = (void *)objc_msgSend_address(a3, v67, v68, v69);
  v74 = objc_msgSend_postalCode(v70, v71, v72, v73);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v75, v74, (uint64_t)CFSTR("ZIP"));
  v79 = (void *)objc_msgSend_address(a3, v76, v77, v78);
  v83 = objc_msgSend_countryCode(v79, v80, v81, v82);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v84, v83, (uint64_t)CFSTR("CountryCode"));
  v88 = (void *)objc_msgSend_address(a3, v85, v86, v87);
  v92 = objc_msgSend_country(v88, v89, v90, v91);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v93, v92, (uint64_t)CFSTR("Country"));
  v97 = (void *)objc_msgSend_address(a3, v94, v95, v96);
  v101 = objc_msgSend_inlandWater(v97, v98, v99, v100);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v102, v101, (uint64_t)CFSTR("InlandWater"));
  v106 = (void *)objc_msgSend_address(a3, v103, v104, v105);
  v110 = objc_msgSend_ocean(v106, v107, v108, v109);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v111, v110, (uint64_t)CFSTR("Ocean"));
  v115 = objc_msgSend_source(a3, v112, v113, v114);
  v118 = objc_msgSend__cLMapItemSourceFromRLMapItemSource_(CLPlacemark, v116, v115, v117);
  v122 = (void *)objc_msgSend_address(a3, v119, v120, v121);
  v126 = objc_msgSend_areasOfInterest(v122, v123, v124, v125);
  v130 = objc_msgSend_geoMapItemHandle(a3, v127, v128, v129);
  return (id)objc_msgSend_initWithLocation_addressDictionary_region_areasOfInterest_mapItemSource_geoMapItemHandle_meCardAddress_(self, v131, (uint64_t)a4, (uint64_t)v7, 0, v126, v118, v130, &stru_1E2993188);
}

- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6
{
  CLPlacemark *result;
  const char *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLPlacemark;
  result = -[CLPlacemark init](&v12, sel_init);
  if (result)
    return (CLPlacemark *)objc_msgSend_initWithLocation_addressDictionary_region_areasOfInterest_mapItemSource_geoMapItemHandle_meCardAddress_(result, v11, (uint64_t)a3, (uint64_t)a4, a5, a6, 0, 0, &stru_1E2993188);
  return result;
}

- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6 mapItemSource:(unint64_t)a7 geoMapItemHandle:(id)a8 meCardAddress:(id)a9
{
  CLPlacemark *result;
  const char *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLPlacemark;
  result = -[CLPlacemark init](&v17, sel_init);
  if (result)
    return (CLPlacemark *)objc_msgSend_initWithLocation_addressDictionary_region_areasOfInterest_mapItemSource_geoMapItemHandle_category_meCardAddress_(result, v16, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, 0, a9);
  return result;
}

- (CLPlacemark)initWithLocation:(id)a3 addressDictionary:(id)a4 region:(id)a5 areasOfInterest:(id)a6 mapItemSource:(unint64_t)a7 geoMapItemHandle:(id)a8 category:(id)a9 meCardAddress:(id)a10
{
  CLPlacemark *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)CLPlacemark;
  v16 = -[CLPlacemark init](&v39, sel_init);
  if (v16)
  {
    v16->_internal = objc_alloc_init(CLPlacemarkInternal);
    v16->_internal->location = (CLLocation *)objc_msgSend_copy(a3, v17, v18, v19);
    v16->_internal->addressDictionary = (NSDictionary *)objc_msgSend_copy(a4, v20, v21, v22);
    v16->_internal->region = (CLRegion *)objc_msgSend_copy(a5, v23, v24, v25);
    v16->_internal->areasOfInterest = (NSArray *)objc_msgSend_copy(a6, v26, v27, v28);
    v16->_internal->_cLMapItemSource = a7;
    v16->_internal->_geoMapItemHandle = (NSData *)objc_msgSend_copy(a8, v29, v30, v31);
    v16->_internal->category = (NSString *)objc_msgSend_copy(a9, v32, v33, v34);
    v16->_internal->mecardAddress = (NSString *)objc_msgSend_copy(a10, v35, v36, v37);
  }
  return v16;
}

- (CLPlacemark)initWithPlacemark:(CLPlacemark *)placemark
{
  CLPlacemark *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CLPlacemark;
  v4 = -[CLPlacemark init](&v47, sel_init);
  if (v4)
  {
    v4->_internal = objc_alloc_init(CLPlacemarkInternal);
    v8 = (void *)objc_msgSend_location(placemark, v5, v6, v7);
    v4->_internal->location = (CLLocation *)objc_msgSend_copy(v8, v9, v10, v11);
    v15 = (void *)objc_msgSend_addressDictionary(placemark, v12, v13, v14);
    v4->_internal->addressDictionary = (NSDictionary *)objc_msgSend_copy(v15, v16, v17, v18);
    v22 = (void *)objc_msgSend_region(placemark, v19, v20, v21);
    v4->_internal->region = (CLRegion *)objc_msgSend_copy(v22, v23, v24, v25);
    v29 = (void *)objc_msgSend_areasOfInterest(placemark, v26, v27, v28);
    v4->_internal->areasOfInterest = (NSArray *)objc_msgSend_copy(v29, v30, v31, v32);
    if (placemark)
    {
      v4->_internal->geoMapItemStorage = (GEOMapItemStorage *)objc_msgSend_copy(placemark->_internal->geoMapItemStorage, v33, v34, v35);
      v4->_internal->_geoMapItemHandle = (NSData *)objc_msgSend_copy(placemark->_internal->_geoMapItemHandle, v36, v37, v38);
      v4->_internal->category = (NSString *)objc_msgSend_copy(placemark->_internal->category, v39, v40, v41);
      v45 = objc_msgSend_copy(placemark->_internal->mecardAddress, v42, v43, v44);
    }
    else
    {
      v45 = 0;
      v4->_internal->geoMapItemStorage = 0;
      v4->_internal->_geoMapItemHandle = 0;
      v4->_internal->category = 0;
    }
    v4->_internal->mecardAddress = (NSString *)v45;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLPlacemark)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v4, v8, v5, v9, v6, v7, 0);
  v11 = objc_opt_class();
  v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCLPlacemarkCodingKeyLocation"));
  v15 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v14, v10, (uint64_t)CFSTR("kCLPlacemarkCodingKeyAddress"));
  v16 = objc_opt_class();
  v18 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCLPlacemarkCodingKeyRegion"));
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v24 = objc_msgSend_setWithObjects_(v19, v22, v20, v23, v21, 0);
  v26 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v25, v24, (uint64_t)CFSTR("kCLPlacemarkCodingKeyAreasOfInterest"));
  v27 = objc_opt_class();
  v29 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v28, v27, (uint64_t)CFSTR("kCLPlacemarkCodingKeyMapItemSource"));
  v33 = objc_msgSend_unsignedIntegerValue(v29, v30, v31, v32);
  v34 = objc_opt_class();
  v36 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v35, v34, (uint64_t)CFSTR("kCLPlacemarkCodingKeyGEOMapItem"));
  v37 = objc_opt_class();
  v39 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v38, v37, (uint64_t)CFSTR("kCLPlacemarkCodingKeyGEOMapItemHandle"));
  v40 = objc_opt_class();
  v42 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v41, v40, (uint64_t)CFSTR("kCLPlacemarkCodingKeyCategory"));
  v43 = objc_opt_class();
  v45 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v44, v43, (uint64_t)CFSTR("kCLPlacemarkCodingKeyMeCardAddress"));
  if (v36)
    return (CLPlacemark *)objc_msgSend__initWithGeoMapItem_(self, v46, v36, v47);
  else
    return (CLPlacemark *)objc_msgSend_initWithLocation_addressDictionary_region_areasOfInterest_mapItemSource_geoMapItemHandle_category_meCardAddress_(self, v46, v13, v15, v18, v26, v33, v39, v42, v45);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t *internal;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;

  internal = (uint64_t *)self->_internal;
  objc_msgSend_encodeObject_forKey_(a3, a2, internal[1], (uint64_t)CFSTR("kCLPlacemarkCodingKeyLocation"));
  objc_msgSend_encodeObject_forKey_(a3, v5, internal[2], (uint64_t)CFSTR("kCLPlacemarkCodingKeyAddress"));
  objc_msgSend_encodeObject_forKey_(a3, v6, internal[3], (uint64_t)CFSTR("kCLPlacemarkCodingKeyRegion"));
  objc_msgSend_encodeObject_forKey_(a3, v7, internal[4], (uint64_t)CFSTR("kCLPlacemarkCodingKeyAreasOfInterest"));
  v10 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v8, internal[7], v9);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLPlacemarkCodingKeyMapItemSource"));
  objc_msgSend_encodeObject_forKey_(a3, v12, internal[5], (uint64_t)CFSTR("kCLPlacemarkCodingKeyGEOMapItem"));
  objc_msgSend_encodeObject_forKey_(a3, v13, internal[8], (uint64_t)CFSTR("kCLPlacemarkCodingKeyGEOMapItemHandle"));
  objc_msgSend_encodeObject_forKey_(a3, v14, internal[9], (uint64_t)CFSTR("kCLPlacemarkCodingKeyCategory"));
  objc_msgSend_encodeObject_forKey_(a3, v15, internal[10], (uint64_t)CFSTR("kCLPlacemarkCodingKeyMeCardAddress"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithPlacemark_, self, v9);
}

- (CLRegion)region
{
  return self->_internal->region;
}

- (NSTimeZone)timeZone
{
  return self->_internal->timeZone;
}

- (id)mecardAddress
{
  return self->_internal->mecardAddress;
}

- (NSDictionary)addressDictionary
{
  return self->_internal->addressDictionary;
}

- (NSString)name
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("Name"), v2);
}

- (NSString)thoroughfare
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("Thoroughfare"), v2);
}

- (NSString)subThoroughfare
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("SubThoroughfare"), v2);
}

- (NSString)subLocality
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("SubLocality"), v2);
}

- (NSString)country
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("Country"), v2);
}

- (id)fullThoroughfare
{
  uint64_t v2;

  return (id)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("Street"), v2);
}

- (id)formattedAddressLines
{
  uint64_t v2;

  return (id)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("FormattedAddressLines"), v2);
}

- (void)fetchFormattedAddress:(id)a3 queue:(id)a4
{
  NSObject *v5;
  NSData *geoMapItemHandle;
  _QWORD v7[6];
  _QWORD v8[6];

  if (a3)
  {
    if (a4)
      v5 = a4;
    else
      v5 = MEMORY[0x1E0C80D38];
    geoMapItemHandle = self->_internal->_geoMapItemHandle;
    if (geoMapItemHandle)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_18F6E58F0;
      v8[3] = &unk_1E2992A78;
      v8[4] = v5;
      v8[5] = a3;
      objc_msgSend_hydrateGeoMapItemLocallyFromHandle_completionHandler_(CLGeocoder, a2, (uint64_t)geoMapItemHandle, (uint64_t)v8);
    }
    else
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_18F6E599C;
      v7[3] = &unk_1E2990E58;
      v7[4] = self;
      v7[5] = a3;
      dispatch_async(v5, v7);
    }
  }
}

- (NSArray)areasOfInterest
{
  return self->_internal->areasOfInterest;
}

- (NSString)inlandWater
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("InlandWater"), v2);
}

- (NSString)ocean
{
  uint64_t v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_internal->addressDictionary, a2, (uint64_t)CFSTR("Ocean"), v2);
}

- (id)_geoMapItem
{
  return self->_internal->geoMapItemStorage;
}

- (id)_geoMapItemHandle
{
  return self->_internal->_geoMapItemHandle;
}

- (id)category
{
  return self->_internal->category;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CLLocation *location;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  CLPlacemarkInternal *internal;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  _QWORD v54[5];

  v4 = (void *)objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], a2, (uint64_t)&stru_1E2993188, v2);
  v8 = (void *)objc_msgSend_name(self, v5, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v8, v9, v10, v11))
    objc_msgSend_appendString_(v4, v9, (uint64_t)v8, v11);
  if (self->_internal->addressDictionary)
  {
    v12 = (void *)objc_msgSend_formattedAddressLines(self, v9, v10, v11);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend_count(v12, v9, v10, v11))
      {
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = sub_18F6E5C94;
        v54[3] = &unk_1E2991290;
        v54[4] = v4;
        objc_msgSend_enumerateObjectsUsingBlock_(v12, v9, (uint64_t)v54, v11);
      }
    }
  }
  location = self->_internal->location;
  if (location)
  {
    objc_msgSend_horizontalAccuracy(location, v9, v10, v11);
    if (v14 >= 0.0)
    {
      if (objc_msgSend_length(v4, v9, v10, v11))
        objc_msgSend_appendString_(v4, v15, (uint64_t)CFSTR(" @ "), v17);
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_coordinate(self->_internal->location, v15, v16, v17);
      v20 = v19;
      objc_msgSend_coordinate(self->_internal->location, v21, v22, v23);
      v25 = v24;
      objc_msgSend_horizontalAccuracy(self->_internal->location, v26, v27, v28);
      v32 = objc_msgSend_stringWithFormat_(v18, v29, (uint64_t)CFSTR("<%+.8f,%+.8f> +/- %.2fm"), v30, v20, v25, v31);
      objc_msgSend_appendString_(v4, v33, v32, v34);
    }
  }
  internal = self->_internal;
  if (internal->region)
  {
    if (objc_msgSend_length(v4, v9, v10, v11))
      objc_msgSend_appendString_(v4, v36, (uint64_t)CFSTR(", region "), v38);
    v39 = objc_msgSend_description(self->_internal->region, v36, v37, v38);
    objc_msgSend_appendString_(v4, v40, v39, v41);
    internal = self->_internal;
  }
  if (internal->_cLMapItemSource)
  {
    if (objc_msgSend_length(v4, v9, v10, v11))
      objc_msgSend_appendString_(v4, v42, (uint64_t)CFSTR(", source "), v43);
    v44 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v42, (uint64_t)CFSTR("%lu"), v43, self->_internal->_cLMapItemSource);
    objc_msgSend_appendString_(v4, v45, v44, v46);
    internal = self->_internal;
  }
  if (internal->category)
  {
    if (objc_msgSend_length(v4, v9, v10, v11))
      objc_msgSend_appendString_(v4, v47, (uint64_t)CFSTR(", category "), v49);
    v50 = objc_msgSend_description(self->_internal->category, v47, v48, v49);
    objc_msgSend_appendString_(v4, v51, v50, v52);
  }
  return v4;
}

- (CNPostalAddress)postalAddress
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  Class v52;
  const char *v53;
  uint64_t v54;
  CNPostalAddress *v55;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_msgSend_fullThoroughfare(self, v4, v5, v6);
  v8 = off_1ECD8E760();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, v7, v8);
  v13 = objc_msgSend_subLocality(self, v10, v11, v12);
  v14 = off_1ECD8E768();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, v13, v14);
  v19 = objc_msgSend_locality(self, v16, v17, v18);
  v20 = off_1ECD8E770();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, v19, v20);
  v25 = objc_msgSend_subAdministrativeArea(self, v22, v23, v24);
  v26 = off_1ECD8E778();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v27, v25, v26);
  v31 = objc_msgSend_administrativeArea(self, v28, v29, v30);
  v32 = off_1ECD8E780();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, v31, v32);
  v37 = objc_msgSend_postalCode(self, v34, v35, v36);
  v38 = off_1ECD8E788();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v39, v37, v38);
  v43 = objc_msgSend_country(self, v40, v41, v42);
  v44 = off_1ECD8E790();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, v43, v44);
  v49 = objc_msgSend_ISOcountryCode(self, v46, v47, v48);
  v50 = off_1ECD8E798();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v51, v49, v50);
  v52 = (Class)off_1ECD8E7A0();
  v55 = (CNPostalAddress *)objc_msgSend_postalAddressWithDictionaryRepresentation_(v52, v53, (uint64_t)v3, v54);

  return v55;
}

@end
