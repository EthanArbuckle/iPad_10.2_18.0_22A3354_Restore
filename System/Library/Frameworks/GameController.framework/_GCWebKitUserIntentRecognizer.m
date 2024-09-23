@implementation _GCWebKitUserIntentRecognizer

- (_GCWebKitUserIntentRecognizer)initWithPhysicalInputProfile:(id)a3 thumbstickUserIntentHandler:(id)a4
{
  return -[_GCWebKitUserIntentRecognizer initWithPhysicalInputProfile:thumbstickUserIntentHandler:slidingWindowTotalDuration:slidingWindowSegmentDuration:deadzone:sensitivity:](self, "initWithPhysicalInputProfile:thumbstickUserIntentHandler:slidingWindowTotalDuration:slidingWindowSegmentDuration:deadzone:sensitivity:", a3, a4, 1, 1.0, 0.0500000007, 0.0222999994);
}

- (_GCWebKitUserIntentRecognizer)initWithPhysicalInputProfile:(id)a3 thumbstickUserIntentHandler:(id)a4 slidingWindowTotalDuration:(double)a5 slidingWindowSegmentDuration:(double)a6 deadzone:(double)a7 sensitivity:(int)a8
{
  id v14;
  id v15;
  _GCWebKitUserIntentRecognizer *v16;
  _GCWebKitUserIntentRecognizer *v17;
  uint64_t v18;
  id thumbstickUserIntentHandler;
  uint64_t v20;
  NSMutableDictionary *trackedInputs;
  NSObject *v23;
  double slidingWindowTotalDuration;
  double slidingWindowSegmentDuration;
  double deadzoneSquared;
  int distanceThreshold;
  objc_super v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_GCWebKitUserIntentRecognizer;
  v16 = -[_GCWebKitUserIntentRecognizer init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_physicalInputProfile, v14);
    v18 = objc_msgSend(v15, "copy");
    thumbstickUserIntentHandler = v17->_thumbstickUserIntentHandler;
    v17->_thumbstickUserIntentHandler = (id)v18;

    v20 = objc_opt_new();
    trackedInputs = v17->_trackedInputs;
    v17->_trackedInputs = (NSMutableDictionary *)v20;

    v17->_slidingWindowTotalDuration = a5;
    v17->_slidingWindowSegmentDuration = a6;
    v17->_deadzoneSquared = a7 * a7;
    v17->_distanceThreshold = (int)(float)((float)(1.0 / (float)a8) * 6.0);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        slidingWindowTotalDuration = v17->_slidingWindowTotalDuration;
        slidingWindowSegmentDuration = v17->_slidingWindowSegmentDuration;
        deadzoneSquared = v17->_deadzoneSquared;
        distanceThreshold = v17->_distanceThreshold;
        *(_DWORD *)buf = 138413314;
        v30 = v14;
        v31 = 2048;
        v32 = slidingWindowTotalDuration;
        v33 = 2048;
        v34 = slidingWindowSegmentDuration;
        v35 = 2048;
        v36 = deadzoneSquared;
        v37 = 1024;
        v38 = distanceThreshold;
        _os_log_impl(&dword_215181000, v23, OS_LOG_TYPE_INFO, "Registering _GCWebKitUserIntentRecognizer for %@\n\tslidingWindowTotalDuration = %f\n\tslidingWindowSegmentDuration = %f\n\tdeadzoneSquared = %f\n\tdistanceThreshold = %d", buf, 0x30u);
      }

    }
  }

  return v17;
}

- (void)processChangedElements:(id)a3 atTimestamp:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  NSMutableDictionary *trackedInputs;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  unint64_t i;
  void *v23;
  double v24;
  double v25;
  float v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  _GCUserIntentInputEvent *v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  _GCUserIntentInputEvent *v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  id WeakRetained;
  NSObject *v53;
  id *p_physicalInputProfile;
  id obj;
  uint64_t v57;
  uint64_t v58;
  _QWORD block[5];
  id v60;
  id v61;
  id location;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = a3;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v64;
    p_physicalInputProfile = (id *)&self->_physicalInputProfile;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v64 != v57)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v5);
        objc_msgSend(v6, "primaryAlias", p_physicalInputProfile);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("Left Thumbstick")))
        {

        }
        else
        {
          objc_msgSend(v6, "primaryAlias");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Right Thumbstick"));

          if (!v9)
            goto LABEL_46;
        }
        v10 = v6;
        trackedInputs = self->_trackedInputs;
        objc_msgSend(v10, "primaryAlias");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](trackedInputs, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(trackedInputs) = v13 == 0;

        if ((_DWORD)trackedInputs)
        {
          v14 = (void *)objc_opt_new();
          v15 = self->_trackedInputs;
          objc_msgSend(v10, "primaryAlias");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v16);

        }
        v17 = self->_trackedInputs;
        objc_msgSend(v10, "primaryAlias");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = mach_absolute_time();
        if (timestampToSecondsMultiplier_onceToken != -1)
          dispatch_once(&timestampToSecondsMultiplier_onceToken, &__block_literal_global_27);
        v21 = *(double *)&timestampToSecondsMultiplier_multiplier * (double)v20;
        for (i = 0; objc_msgSend(v19, "count") > i; ++i)
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", i);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timestampInSeconds");
          v25 = v24;

          v26 = v21 - v25;
          if (self->_slidingWindowTotalDuration >= v26)
            break;
        }
        objc_msgSend(v19, "removeObjectsInRange:", 0, i);
        objc_msgSend(v19, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timestampInSeconds");
        v29 = v28;
        if (!objc_msgSend(v19, "count") || (v30 = v21 - v29, v21 - v29 >= self->_slidingWindowSegmentDuration))
        {
          v31 = [_GCUserIntentInputEvent alloc];
          objc_msgSend(v10, "xAxis");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "value");
          v34 = v33;
          objc_msgSend(v10, "yAxis");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "value");
          LODWORD(v37) = v36;
          LODWORD(v38) = v34;
          v39 = -[_GCUserIntentInputEvent initWithXValue:yValue:timestamp:deadzoneSquared:](v31, "initWithXValue:yValue:timestamp:deadzoneSquared:", a4, v38, v37, self->_deadzoneSquared);

          if (-[_GCUserIntentInputEvent octant](v39, "octant") != -1)
          {
            if (!objc_msgSend(v19, "count")
              || v27 && (v40 = objc_msgSend(v27, "octant"), v40 != -[_GCUserIntentInputEvent octant](v39, "octant")))
            {
              objc_msgSend(v19, "addObject:", v39);
            }
          }

        }
        if ((unint64_t)objc_msgSend(v19, "count", v30) >= 2)
        {
          if (objc_msgSend(v19, "count") == 1)
          {
            v41 = 0;
          }
          else
          {
            v42 = 0;
            v41 = 0;
            do
            {
              objc_msgSend(v19, "objectAtIndexedSubscript:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndexedSubscript:", ++v42);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v43, "octant");
              v46 = objc_msgSend(v44, "octant");
              if (v46 <= v45)
                v47 = v45;
              else
                v47 = v46;
              if (v46 >= v45)
                v48 = v45;
              else
                v48 = v46;
              if (v47 - v48 >= 5)
                v49 = v48 + 8;
              else
                v49 = v47;
              if (v47 - v48 < 5)
                LODWORD(v47) = v48;
              v50 = v49 - v47;
              if (v50 >= 0)
                v51 = v50;
              else
                v51 = -v50;

              v41 += v51;
            }
            while (objc_msgSend(v19, "count") - 1 > v42);
          }
          if (v41 >= self->_distanceThreshold)
          {
            objc_initWeak(&location, self);
            WeakRetained = objc_loadWeakRetained(p_physicalInputProfile);
            objc_msgSend(WeakRetained, "handlerQueue");
            v53 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __68___GCWebKitUserIntentRecognizer_processChangedElements_atTimestamp___block_invoke;
            block[3] = &unk_24D2B3DE0;
            objc_copyWeak(&v61, &location);
            block[4] = v10;
            v60 = v19;
            dispatch_async(v53, block);

            objc_destroyWeak(&v61);
            objc_destroyWeak(&location);
          }
        }

LABEL_46:
        ++v5;
      }
      while (v5 != v58);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v58);
  }

}

- (id)thumbstickUserIntentHandler
{
  return self->_thumbstickUserIntentHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_thumbstickUserIntentHandler, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_trackedInputs, 0);
  objc_destroyWeak((id *)&self->_physicalInputProfile);
}

@end
