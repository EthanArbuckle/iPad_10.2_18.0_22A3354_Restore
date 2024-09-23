@implementation CPSInstrumentClusterCardLayout

+ (id)layoutWithLayoutType:(unint64_t)a3
{
  return -[CPSInstrumentClusterCardLayout initWithLayout:]([CPSInstrumentClusterCardLayout alloc], "initWithLayout:", a3);
}

- (CPSInstrumentClusterCardLayout)initWithLayout:(unint64_t)a3
{
  CPSInstrumentClusterCardLayout *v4;
  CPSInstrumentClusterCardLayout *v5;
  os_log_t oslog;
  objc_super v7;
  unint64_t v8;
  SEL v9;
  CPSInstrumentClusterCardLayout *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v8 = a3;
  v10 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CPSInstrumentClusterCardLayout;
  v5 = -[CPSInstrumentClusterCardLayout init](&v7, sel_init);
  v10 = v5;
  objc_storeStrong((id *)&v10, v5);
  if (v5)
  {
    v10->_layoutForCard = v8;
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v11, v10->_layoutForCard);
      _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_INFO, "Layout Calculation: Explicity using layout %lu", v11, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v4 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v4;
}

- (char)initWithSafeAreaFrame:(char)a3 viewAreaFrame:(CGFloat)a4 displayFrame:(CGFloat)a5 physicalPixelWidth:(CGFloat)a6 isRightHandDrive:(CGFloat)a7
{
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v25;
  os_log_type_t v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  NSObject *log;
  os_log_type_t v31;
  id v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  char *v36;
  os_log_t v37;
  uint8_t v38[7];
  os_log_type_t v39;
  os_log_t v40;
  uint8_t v41[7];
  os_log_type_t v42;
  os_log_t v43;
  os_log_type_t v44;
  os_log_t v45;
  double v46;
  double MidX;
  double v48;
  NSString *v49;
  NSString *v50;
  NSString *v51;
  os_log_type_t type;
  os_log_t oslog;
  objc_super v54;
  char v55;
  double v56;
  uint64_t v57;
  char *v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  uint8_t v62[32];
  uint8_t v63[64];
  uint8_t v64[56];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v61.origin.x = a4;
  v61.origin.y = a5;
  v61.size.width = a6;
  v61.size.height = a7;
  v60.origin.x = a8;
  v60.origin.y = a9;
  v60.size.width = a10;
  v60.size.height = a11;
  v59.origin.x = a12;
  v59.origin.y = a13;
  v59.size.width = a14;
  v59.size.height = a15;
  v57 = a2;
  v56 = a16;
  v55 = a3 & 1;
  v58 = 0;
  v54.receiver = a1;
  v54.super_class = (Class)CPSInstrumentClusterCardLayout;
  v36 = (char *)objc_msgSendSuper2(&v54, sel_init);
  v58 = v36;
  objc_storeStrong((id *)&v58, v36);
  if (v36)
  {
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      log = oslog;
      v31 = type;
      v35 = NSStringFromCGRect(v61);
      v27 = v35;
      v51 = v27;
      v34 = NSStringFromCGRect(v60);
      v28 = v34;
      v50 = v28;
      v33 = NSStringFromCGRect(v59);
      v29 = v33;
      v49 = v29;
      v32 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v56);
      __os_log_helper_16_2_4_8_64_8_64_8_64_8_64((uint64_t)v64, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29, (uint64_t)v32);
      _os_log_impl(&dword_21E389000, log, v31, "Layout Calculation: pixelSafeArea: %@, pixelViewArea: %@, pixelDisplayFrame: %@, pixelPhysicalWidth: %@", v64, 0x2Au);

      objc_storeStrong((id *)&v49, 0);
      objc_storeStrong((id *)&v50, 0);
      objc_storeStrong((id *)&v51, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v58[8] = 1;
    *(CGRect *)(v58 + 24) = v61;
    *(CGRect *)(v58 + 56) = v60;
    v48 = 0.153 / v56;
    if (v61.size.width < 660.0 * (0.153 / v56))
    {
      if (0.3 * v61.size.height <= 115.0 * v48)
      {
        *((_QWORD *)v58 + 2) = 0;
        v40 = (os_log_t)CarPlaySupportGeneralLogging();
        v39 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v23 = v40;
          v24 = v39;
          __os_log_helper_16_0_0(v38);
          _os_log_error_impl(&dword_21E389000, v23, v24, "Layout Calculation: Using undefined layout", v38, 2u);
        }
        objc_storeStrong((id *)&v40, 0);
      }
      else
      {
        *((_QWORD *)v58 + 2) = 1;
        v43 = (os_log_t)CarPlaySupportGeneralLogging();
        v42 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v25 = v43;
          v26 = v42;
          __os_log_helper_16_0_0(v41);
          _os_log_impl(&dword_21E389000, v25, v26, "Layout Calculation: Using center layout", v41, 2u);
        }
        objc_storeStrong((id *)&v43, 0);
      }
    }
    else
    {
      MidX = CGRectGetMidX(v61);
      v46 = CGRectGetMidX(v59);
      if (MidX >= v46)
      {
        if (MidX <= v46)
        {
          if ((v55 & 1) != 0)
            *((_QWORD *)v58 + 2) = 3;
          else
            *((_QWORD *)v58 + 2) = 2;
        }
        else
        {
          *((_QWORD *)v58 + 2) = 3;
        }
      }
      else
      {
        *((_QWORD *)v58 + 2) = 2;
      }
      v45 = (os_log_t)CarPlaySupportGeneralLogging();
      v44 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_4_0_8_0((uint64_t)v63, *(uint64_t *)&v61.size.width, COERCE__INT64(660.0 * v48), *(uint64_t *)&MidX, *(uint64_t *)&v46, v55 & 1, *((_QWORD *)v58 + 2));
        _os_log_impl(&dword_21E389000, v45, v44, "Layout Calculation: Safe area width %f is greater than %f. Safe area mid: %f, Display mid: %f. is RHD: %d. using layout %lu", v63, 0x3Au);
      }
      objc_storeStrong((id *)&v45, 0);
    }
    if (v61.size.height <= 202.0)
    {
      v37 = (os_log_t)CarPlaySupportGeneralLogging();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v62, *(uint64_t *)&v61.size.height, 0x4069400000000000);
        _os_log_impl(&dword_21E389000, v37, OS_LOG_TYPE_INFO, "Layout Calculation: Safe area height %f is less/equal to %f. Not showing ETA with turn card", v62, 0x16u);
      }
      objc_storeStrong((id *)&v37, 0);
      v58[8] = 0;
    }
  }
  v22 = v58;
  objc_storeStrong((id *)&v58, 0);
  return v22;
}

- (CPSInstrumentClusterCardLayout)initWithCarScreenInfo:(id)a3 isRightHandDrive:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  CPSInstrumentClusterCardLayout *v17;
  double v18;
  id v21;
  id v22;
  double v23;
  CPSInstrumentClusterCardLayout *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id location[2];
  CPSInstrumentClusterCardLayout *v38;

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = (id)objc_msgSend(location[0], "currentViewArea");
  objc_msgSend(v21, "safeFrame");
  v33 = v4;
  v34 = v5;
  v35 = v6;
  v36 = v7;

  v22 = (id)objc_msgSend(location[0], "currentViewArea");
  objc_msgSend(v22, "visibleFrame");
  v29 = v8;
  v30 = v9;
  v31 = v10;
  v32 = v11;

  objc_msgSend(location[0], "pixelSize");
  objc_msgSend(location[0], "pixelSize");
  CGRectMake_6();
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  objc_msgSend(location[0], "physicalSize");
  v23 = v16;
  objc_msgSend(location[0], "pixelSize");
  v17 = v38;
  v38 = 0;
  v38 = -[CPSInstrumentClusterCardLayout initWithSafeAreaFrame:viewAreaFrame:displayFrame:physicalPixelWidth:isRightHandDrive:](v17, "initWithSafeAreaFrame:viewAreaFrame:displayFrame:physicalPixelWidth:isRightHandDrive:", a4, v33, v34, v35, v36, v29, v30, v31, v32, v25, v26, v27, v28, v23 / v18);
  v24 = v38;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v38, 0);
  return v24;
}

- (unint64_t)layoutForCard
{
  return self->_layoutForCard;
}

- (void)setLayoutForCard:(unint64_t)a3
{
  self->_layoutForCard = a3;
}

- (BOOL)showETAWithTurnCard
{
  return self->_showETAWithTurnCard;
}

- (void)setShowETAWithTurnCard:(BOOL)a3
{
  self->_showETAWithTurnCard = a3;
}

- (CGRect)safeArea
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  y = self->_safeArea.origin.y;
  x = self->_safeArea.origin.x;
  height = self->_safeArea.size.height;
  width = self->_safeArea.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSafeArea:(CGRect)a3
{
  self->_safeArea = a3;
}

- (CGRect)viewArea
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  y = self->_viewArea.origin.y;
  x = self->_viewArea.origin.x;
  height = self->_viewArea.size.height;
  width = self->_viewArea.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setViewArea:(CGRect)a3
{
  self->_viewArea = a3;
}

@end
