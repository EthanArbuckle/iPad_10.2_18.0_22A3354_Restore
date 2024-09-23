@implementation PHASEDucker

- (PHASEDucker)init
{
  -[PHASEDucker doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEDucker)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEDucker)initWithEngine:(PHASEEngine *)engine sourceGroups:(NSSet *)sourceGroups targetGroups:(NSSet *)targetGroups gain:(double)gain attackTime:(double)attackTime releaseTime:(double)releaseTime attackCurve:(PHASECurveType)attackCurve releaseCurve:(PHASECurveType)releaseCurve
{
  return -[PHASEDucker initWithEngine:sourceGroups:targetGroups:gain:gainHighFrequency:gainLowFrequency:attackTime:releaseTime:attackCurve:releaseCurve:](self, "initWithEngine:sourceGroups:targetGroups:gain:gainHighFrequency:gainLowFrequency:attackTime:releaseTime:attackCurve:releaseCurve:", engine, sourceGroups, targetGroups, attackCurve, releaseCurve, gain, 1.0, 1.0, attackTime, releaseTime);
}

- (PHASEDucker)initWithEngine:(id)a3 sourceGroups:(id)a4 targetGroups:(id)a5 gain:(double)a6 lowFrequencyGain:(double)a7 highFrequencyGain:(double)a8 attackTime:(double)a9 releaseTime:(double)a10 attackCurve:(int64_t)a11 releaseCurve:(int64_t)a12
{
  return -[PHASEDucker initWithEngine:sourceGroups:targetGroups:gain:gainHighFrequency:gainLowFrequency:attackTime:releaseTime:attackCurve:releaseCurve:](self, "initWithEngine:sourceGroups:targetGroups:gain:gainHighFrequency:gainLowFrequency:attackTime:releaseTime:attackCurve:releaseCurve:", a3, a4, a5, a11, a12, a6, a8, a7, a9, a10);
}

- (PHASEDucker)initWithEngine:(id)a3 sourceGroups:(id)a4 targetGroups:(id)a5 gain:(double)a6 gainHighFrequency:(double)a7 gainLowFrequency:(double)a8 attackTime:(double)a9 releaseTime:(double)a10 attackCurve:(int64_t)a11 releaseCurve:(int64_t)a12
{
  id v21;
  PHASEDucker *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v28;
  BOOL v29;
  Phase::Logger *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  id v36;
  BOOL v37;
  Phase::Logger *v38;
  uint64_t v39;
  NSSet *sourceGroups;
  uint64_t v41;
  NSSet *targetGroups;
  objc_class *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSString *identifier;
  PHASEDucker *v61;
  NSObject *v62;
  id v63;
  uint64_t v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  int64_t v69;
  int64_t v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  objc_super v81;
  uint8_t v82[128];
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;

  v69 = a11;
  v70 = a12;
  v90 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v72 = a4;
  v71 = a5;
  v81.receiver = self;
  v81.super_class = (Class)PHASEDucker;
  v22 = -[PHASEDucker init](&v81, sel_init);
  if (v22)
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v23 = v72;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v78;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v78 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v27, "engine", v69, v70);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = v28 == v21;

          if (!v29)
          {
            v62 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v30)
                                                                                                + 432)));
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v27, "identifier");
              v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v64 = objc_msgSend(v63, "UTF8String");
              *(_DWORD *)buf = 136315650;
              v84 = "PHASEDucker.mm";
              v85 = 1024;
              v86 = 107;
              v87 = 2080;
              v88 = v64;
              _os_log_impl(&dword_2164CC000, v62, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to initialize ducker: Group %s is from a different engine instance", buf, 0x1Cu);

            }
LABEL_26:
            v61 = 0;
            goto LABEL_27;
          }
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        if (v24)
          continue;
        break;
      }
    }

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v31 = v71;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v74;
      while (2)
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v74 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          objc_msgSend(v35, "engine", v69, v70);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          v37 = v36 == v21;

          if (!v37)
          {
            v65 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v38)
                                                                                                + 432)));
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v35, "identifier");
              v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v67 = objc_msgSend(v66, "UTF8String");
              *(_DWORD *)buf = 136315650;
              v84 = "PHASEDucker.mm";
              v85 = 1024;
              v86 = 118;
              v87 = 2080;
              v88 = v67;
              _os_log_impl(&dword_2164CC000, v65, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to initialize ducker: Group %s is from a different engine instance", buf, 0x1Cu);

            }
            goto LABEL_26;
          }
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
        if (v32)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v23);
    v39 = objc_claimAutoreleasedReturnValue();
    sourceGroups = v22->_sourceGroups;
    v22->_sourceGroups = (NSSet *)v39;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v31);
    v41 = objc_claimAutoreleasedReturnValue();
    targetGroups = v22->_targetGroups;
    v22->_targetGroups = (NSSet *)v41;

    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_gain = PHASEGetPropertyBounded<double>(v44, v45, a6, 0.0, 1.0);

    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_gainHighFrequency = PHASEGetPropertyBounded<double>(v47, v48, a7, 0.0, 1.0);

    v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_gainLowFrequency = PHASEGetPropertyBounded<double>(v50, v51, a8, 0.0, 1.0);

    v52 = (objc_class *)objc_opt_class();
    NSStringFromClass(v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_attackTime = PHASEGetPropertyBounded<double>(v53, v54, a9, 0.0, 1.79769313e308);

    v55 = (objc_class *)objc_opt_class();
    NSStringFromClass(v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_releaseTime = PHASEGetPropertyBounded<double>(v56, v57, a10, 0.0, 1.79769313e308);

    objc_storeWeak((id *)&v22->_engine, v21);
    v22->_attackCurve = v69;
    v22->_releaseCurve = v70;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "UUIDString");
    v59 = objc_claimAutoreleasedReturnValue();
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v59;

    v22->_active = 0;
  }
  v61 = v22;
LABEL_27:

  return v61;
}

- (NSSet)sourceGroups
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_sourceGroups);
}

- (NSSet)targetGroups
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_targetGroups);
}

- (void)activate
{

  JUMPOUT(0x2199F9D70);
}

- (void)deactivate
{

  JUMPOUT(0x2199F9D70);
}

- (BOOL)isActive
{
  return self->_active;
}

- (double)gain
{
  return self->_gain;
}

- (double)attackTime
{
  return self->_attackTime;
}

- (double)releaseTime
{
  return self->_releaseTime;
}

- (PHASECurveType)attackCurve
{
  return self->_attackCurve;
}

- (PHASECurveType)releaseCurve
{
  return self->_releaseCurve;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)gainHighFrequency
{
  return self->_gainHighFrequency;
}

- (double)gainLowFrequency
{
  return self->_gainLowFrequency;
}

- (NSString)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_targetGroups, 0);
  objc_storeStrong((id *)&self->_sourceGroups, 0);
  objc_destroyWeak((id *)&self->_engine);
}

- (uint64_t)activate
{
  return Phase::Controller::GroupManager::StartDuck(*(Phase::Controller::GroupManager **)(a1 + 8), *(PHASEDucker **)(a1 + 16));
}

- (uint64_t)deactivate
{

  return a1;
}

- (BOOL)deactivate
{
  return Phase::Controller::GroupManager::ReleaseDuck(*(Phase::Controller::GroupManager **)(a1 + 8), *(PHASEDucker **)(a1 + 16));
}

@end
