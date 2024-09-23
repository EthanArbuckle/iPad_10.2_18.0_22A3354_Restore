@implementation HIDAnalyticsReporter

void __42__HIDAnalyticsReporter_logAnalyticsEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "logAnalyticsEvent:eventDescription:eventValue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)logAnalyticsEvent:(id)a3 eventDescription:(id)a4 eventValue:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v10 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke;
    v11[3] = &unk_24D3F2FF8;
    v11[4] = self;
    v12 = v8;
    v13 = v10;
    objc_msgSend(a5, "enumerateObjectsUsingBlock:", v11);

  }
}

- (void)registerEvent:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObject:](self->_events, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

void __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AnalyticsSendEventLazy();

}

- (void)unregisterEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeObject:](self->_events, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  if ((objc_msgSend(v4, "isLogged") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_215A4E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "HIDAnalytics Unregister Send event %@", (uint8_t *)&v6, 0xCu);

    }
    -[HIDAnalyticsReporter logAnalyticsEvent:](self, "logAnalyticsEvent:", v4);
  }

}

- (void)logAnalyticsEvent:(id)a3
{
  id v4;
  void *v5;
  void *DeepCopy;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *queue;
  _QWORD block[4];
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v5, 2uLL);

  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("unknown");
  }

  objc_msgSend(v4, "desc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "desc");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  if (DeepCopy)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__HIDAnalyticsReporter_logAnalyticsEvent___block_invoke;
    block[3] = &unk_24D3F3070;
    objc_copyWeak(&v20, &location);
    v17 = v10;
    v18 = v14;
    v19 = DeepCopy;
    dispatch_async(queue, block);

    objc_destroyWeak(&v20);
  }

  objc_destroyWeak(&location);
}

void __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || !v5 || !v6)
      goto LABEL_10;
    if (objc_msgSend(v6, "unsignedIntegerValue") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "createBucketData:fieldvalue:fieldDescription:", v5, v7, *(_QWORD *)(a1 + 40));
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_10:

        goto LABEL_11;
      }
      v9 = (id)v8;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_2;
      v12[3] = &unk_24D3F3048;
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
      v10 = v13;
    }
    else
    {
      v14[0] = CFSTR("FieldName");
      v14[1] = CFSTR("FieldValue");
      v15[0] = v5;
      v15[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      AnalyticsSendEventLazy();
      v10 = v11;
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (id)createBucketData:(id)a3 fieldvalue:(id)a4 fieldDescription:(id)a5
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = (objc_class *)MEMORY[0x24BDBCEB8];
    v11 = v8;
    v12 = objc_alloc_init(v10);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __69__HIDAnalyticsReporter_createBucketData_fieldvalue_fieldDescription___block_invoke;
    v17[3] = &unk_24D3F2FF8;
    v18 = v7;
    v19 = v9;
    v13 = v12;
    v20 = v13;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);

    v14 = v20;
    v15 = v13;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __69__HIDAnalyticsReporter_createBucketData_fieldvalue_fieldDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@BucketID"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@BucketCount"), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@Description"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(id *)(a1 + 40);
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v5);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v7);
    if (v10)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v9);
    if (objc_msgSend(v8, "unsignedIntValue"))
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);

  }
}

id __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (HIDAnalyticsReporter)init
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  NSObject *v8;
  dispatch_source_t v9;
  void *v10;
  HIDAnalyticsReporter *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HIDAnalyticsReporter;
  v2 = -[HIDAnalyticsReporter init](&v16, sel_init);
  if (v2)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    *((_DWORD *)v2 + 8) = 0;
    v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.hidanalytics", v5);
    v7 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v6;

    v8 = *((_QWORD *)v2 + 2);
    if (v8)
    {
      v9 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);
      v10 = (void *)*((_QWORD *)v2 + 3);
      *((_QWORD *)v2 + 3) = v9;

      v11 = (HIDAnalyticsReporter *)*((_QWORD *)v2 + 3);
      if (v11)
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __28__HIDAnalyticsReporter_init__block_invoke;
        v13[3] = &unk_24D3F2FD0;
        objc_copyWeak(&v14, &location);
        dispatch_source_set_event_handler(&v11->super, v13);
        dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
        dispatch_activate(*((dispatch_object_t *)v2 + 3));
        v11 = (HIDAnalyticsReporter *)v2;
        objc_destroyWeak(&v14);
      }
    }
    else
    {
      v11 = 0;
    }
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __28__HIDAnalyticsReporter_init__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *DeepCopy;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 8);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithSet:", *(_QWORD *)&v2[2]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v2 + 8);
    if (v3)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v19 = v3;
      obj = v3;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v4)
      {
        v5 = v4;
        v21 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v23 != v21)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "name");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v27 = v8;
              _os_log_impl(&dword_215A4E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "HIDAnalytics Timer Send event %@", buf, 0xCu);

            }
            objc_msgSend(v7, "value");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v9, 2uLL);

            objc_msgSend(v7, "name");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v7, "name");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
              v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v14 = CFSTR("unknown");
            }

            objc_msgSend(v7, "desc");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v7, "desc");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v18 = 0;
            }

            if (!DeepCopy)
            {

              goto LABEL_24;
            }
            os_unfair_lock_lock(v2 + 8);
            if (objc_msgSend(*(id *)&v2[2]._os_unfair_lock_opaque, "containsObject:", v7))
            {
              objc_msgSend(v7, "setValue:", &unk_24D3F4230);
              os_unfair_lock_unlock(v2 + 8);
              -[os_unfair_lock_s logAnalyticsEvent:eventDescription:eventValue:](v2, "logAnalyticsEvent:eventDescription:eventValue:", v14, v18, DeepCopy);
            }
            else
            {
              os_unfair_lock_unlock(v2 + 8);
            }

          }
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
          if (v5)
            continue;
          break;
        }
      }
LABEL_24:

      v3 = v19;
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableSet removeAllObjects](self->_events, "removeAllObjects");
  -[HIDAnalyticsReporter stop](self, "stop");
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)HIDAnalyticsReporter;
  -[HIDAnalyticsReporter dealloc](&v3, sel_dealloc);
}

id __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)start
{
  NSObject *timer;
  dispatch_time_t v3;

  timer = self->_timer;
  v3 = dispatch_time(0x8000000000000000, 0);
  dispatch_source_set_timer(timer, v3, 0x274A48A78000uLL, 0);
}

- (void)stop
{
  dispatch_source_set_timer((dispatch_source_t)self->_timer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

- (void)dispatchAnalyticsForEvent:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[NSMutableSet containsObject:](self->_events, "containsObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_215A4E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "HIDAnalytics Set Value Send event %@", (uint8_t *)&v7, 0xCu);

    }
    -[HIDAnalyticsReporter logAnalyticsEvent:](self, "logAnalyticsEvent:", v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
