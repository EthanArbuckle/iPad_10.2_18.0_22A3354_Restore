@implementation ZN2re4ecs218AudioSessionSystem24willAddSceneToECSServiceEPNS0

_QWORD *___ZN2re4ecs218AudioSessionSystem24willAddSceneToECSServiceEPNS0_5SceneE_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  re::audio *v5;
  re::audio *v6;
  NSObject *MediaserverdPID;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  re::ecs2::NetworkComponent *v15;
  uint64_t v16;
  id v17;
  int v18;
  BOOL v19;
  unsigned int v20;
  NSObject *v21;
  _BOOL4 v22;
  int v23;
  id v24;
  re *v25;
  NSObject *v26;
  id WeakRetained;
  int v29;
  int v30;
  int v31;
  uint8_t buf[4];
  _BYTE v33[18];
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v1 = result[5];
  if (v1)
  {
    v2 = result[4];
    result = *(_QWORD **)(v2 + 112);
    if (result)
    {
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t))(*result + 16))(result, v1);
      if (result)
      {
        v3 = result;
        v4 = *(_QWORD *)(v2 + 112);
        if (v4)
        {
          v5 = (re::audio *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 16))(v4, v1);
          if (v5)
          {
            v6 = v5;
            MediaserverdPID = re::audio::getMediaserverdPID(v5);
            v8 = re::ecs2::SceneComponentTable::get((re::ecs2::SceneComponentTable *)(v1 + 200), (const re::ecs2::ComponentTypeBase *)re::ecs2::ComponentImpl<re::ecs2::AudioSessionComponent,(re::ecs2::ComponentTypeBase::Flags)2>::s_componentType);
            v9 = *(_QWORD *)(v8 + 24);
            if (v9)
            {
              v10 = *(uint64_t **)(v8 + 40);
              v11 = (unint64_t)MediaserverdPID & 0xFF00000000;
              v12 = 8 * v9;
              v31 = (int)MediaserverdPID;
              do
              {
                v13 = *v10;
                v14 = *(_QWORD *)(*v10 + 16);
                if (!v14)
                  break;
                v15 = *(re::ecs2::NetworkComponent **)(v14 + 200);
                if (v15)
                {
                  v16 = re::ecs2::NetworkComponent::owningProcessType(v15);
                  if ((_DWORD)v16)
                    goto LABEL_30;
                }
                v16 = (*(uint64_t (**)(re::audio *))(*(_QWORD *)v6 + 544))(v6);
                if ((v16 & 1) != 0
                  || (v17 = objc_loadWeakRetained((id *)(v13 + 72)),
                      v18 = objc_msgSend(v17, "opaqueSessionID"),
                      v17,
                      v19 = v18 == *(_DWORD *)(v13 + 64),
                      LODWORD(MediaserverdPID) = v31,
                      v19))
                {
LABEL_30:
                  v20 = *(_DWORD *)(v13 + 64);
                  v21 = *re::audioLogObjects((re *)v16);
                  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
                  if (v11 && v20 >> 12 == (_DWORD)MediaserverdPID)
                  {
                    if (v22)
                    {
                      v23 = *(_DWORD *)(v13 + 64);
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v33 = v23;
                      *(_WORD *)&v33[4] = 2048;
                      *(_QWORD *)&v33[6] = v13;
                      _os_log_debug_impl(&dword_224FE9000, v21, OS_LOG_TYPE_DEBUG, "[RE/ECS] [AudioSessionSystem] service reset callback, found updated AudioSessionID 0x%x for component %p", buf, 0x12u);
                    }
                  }
                  else
                  {
                    if (v22)
                    {
                      MediaserverdPID = v21;
                      WeakRetained = objc_loadWeakRetained((id *)(v13 + 72));
                      v29 = *(_DWORD *)(v13 + 64);
                      *(_DWORD *)buf = 134218496;
                      *(_QWORD *)v33 = v13;
                      *(_WORD *)&v33[8] = 2048;
                      *(_QWORD *)&v33[10] = WeakRetained;
                      v34 = 1024;
                      v35 = v29;
                      _os_log_debug_impl(&dword_224FE9000, MediaserverdPID, OS_LOG_TYPE_DEBUG, "[RE/ECS] [AudioSessionSystem] service reset callback, resetting audio session for component %p (session %p, sessionID 0x%x)", buf, 0x1Cu);

                      LODWORD(MediaserverdPID) = v31;
                    }
                    re::ecs2::AudioSessionComponent::clearStateFollowingMediaServicesCrash((re::ecs2::AudioSessionComponent *)v13);
                  }
                }
                else
                {
                  v24 = objc_loadWeakRetained((id *)(v13 + 72));
                  *(_DWORD *)(v13 + 64) = (*(uint64_t (**)(re::audio *, id))(*(_QWORD *)v6 + 760))(v6, v24);

                  v26 = *re::audioLogObjects(v25);
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    v30 = *(_DWORD *)(v13 + 64);
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v33 = v30;
                    *(_WORD *)&v33[4] = 2048;
                    *(_QWORD *)&v33[6] = v13;
                    _os_log_debug_impl(&dword_224FE9000, v26, OS_LOG_TYPE_DEBUG, "[RE/ECS] [AudioSessionSystem] service reset callback, updated AudioSessionID 0x%x for component %p", buf, 0x12u);
                  }
                  re::ecs2::Component::markDirty((_QWORD *)v13);
                }
                ++v10;
                v12 -= 8;
              }
              while (v12);
            }
          }
        }
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t, _QWORD, uint64_t))(*v3 + 88))(v3, 2, *(_QWORD *)(*(_QWORD *)(v1 + 104) + 272) >> 1, 1);
      }
    }
  }
  return result;
}

_QWORD *___ZN2re4ecs218AudioSessionSystem24willAddSceneToECSServiceEPNS0_5SceneE_block_invoke_2(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  re::ecs2::AudioSessionComponent **v3;
  uint64_t v4;
  re::ecs2::AudioSessionComponent *v5;
  id *v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  uint8_t buf[4];
  re::ecs2::AudioSessionComponent *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = result[5];
  if (v1)
  {
    result = *(_QWORD **)(result[4] + 112);
    if (result)
    {
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t))(*result + 16))(result, v1);
      if (result)
      {
        result = (_QWORD *)re::ecs2::SceneComponentTable::get((re::ecs2::SceneComponentTable *)(v1 + 200), (const re::ecs2::ComponentTypeBase *)re::ecs2::ComponentImpl<re::ecs2::AudioSessionComponent,(re::ecs2::ComponentTypeBase::Flags)2>::s_componentType);
        v2 = result[3];
        if (v2)
        {
          v3 = (re::ecs2::AudioSessionComponent **)result[5];
          v4 = 8 * v2;
          while (1)
          {
            v5 = *v3;
            v6 = (id *)((char *)*v3 + 72);
            result = objc_loadWeakRetained(v6);
            if (result)
              break;
            if (*((_DWORD *)v5 + 16))
              goto LABEL_9;
LABEL_12:
            ++v3;
            v4 -= 8;
            if (!v4)
              return result;
          }

LABEL_9:
          v7 = *re::audioLogObjects((re *)result);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            v8 = v7;
            WeakRetained = objc_loadWeakRetained(v6);
            v10 = *((_DWORD *)v5 + 16);
            *(_DWORD *)buf = 134218496;
            v12 = v5;
            v13 = 2048;
            v14 = WeakRetained;
            v15 = 1024;
            v16 = v10;
            _os_log_debug_impl(&dword_224FE9000, v8, OS_LOG_TYPE_DEBUG, "[RE/ECS] [AudioSessionSystem] service lost callback, resetting audio session for component %p (session %p, sessionID 0x%x)", buf, 0x1Cu);

          }
          result = re::ecs2::AudioSessionComponent::clearStateFollowingMediaServicesCrash(v5);
          goto LABEL_12;
        }
      }
    }
  }
  return result;
}

@end
