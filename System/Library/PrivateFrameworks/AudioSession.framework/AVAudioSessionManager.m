@implementation AVAudioSessionManager

- (AVAudioSessionManager)init
{
  AVAudioSessionManager *v2;
  AVAudioSessionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioSessionManager;
  v2 = -[AVAudioSessionManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    os_unfair_lock_lock(&v2->_state.mMutex.m_lock);
    boost::circular_buffer<int,std::allocator<int>>::set_capacity((char **)&v3->_state.mObject, 0x10uLL);
    os_unfair_lock_unlock(&v3->_state.mMutex.m_lock);
  }
  return v3;
}

+ (id)defaultManager
{
  unsigned __int8 v2;

  {
    +[AVAudioSessionManager defaultManager]::gManager = objc_opt_new();
  }
  return (id)+[AVAudioSessionManager defaultManager]::gManager;
}

- (BOOL)trackDaemonPID:(int)a3
{
  synchronized<(anonymous namespace)::ManagerState, caulk::mach::unfair_lock, caulk::empty_atomic_interface<(anonymous namespace)::ManagerState>> *p_state;
  ManagerState *p_mObject;
  int *m_buff;
  BOOL v8;
  int v10;

  v10 = a3;
  p_state = &self->_state;
  p_mObject = &self->_state.mObject;
  os_unfair_lock_lock(&self->_state.mMutex.m_lock);
  if (self->_state.mObject.mServerPIDs.m_size && (m_buff = self->_state.mObject.mServerPIDs.m_first) != 0)
  {
    while (*m_buff != a3)
    {
      if (++m_buff == self->_state.mObject.mServerPIDs.m_end)
        m_buff = p_mObject->mServerPIDs.m_buff;
      if (!m_buff || m_buff == self->_state.mObject.mServerPIDs.m_last)
        goto LABEL_8;
    }
    v8 = 0;
  }
  else
  {
LABEL_8:
    boost::circular_buffer<int,std::allocator<int>>::push_back_impl<int const&>(p_mObject, &v10);
    v8 = 1;
  }
  os_unfair_lock_unlock(&p_state->mMutex.m_lock);
  return v8;
}

- (void)triggerMediaServicesResetNotifications:(int)a3 daemonName:(id)a4
{
  uint64_t v4;
  id v6;
  os_unfair_lock_s *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[AVAudioSessionManager trackDaemonPID:](self, "trackDaemonPID:", v4))
  {
    v7 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
    avfaudio::SessionMap::ValidSessions(v7);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "handleMediaDaemonTerminationEvent:daemonName:", v4, v6, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)isProcessAudioMuted
{
  return self->_processAudioMuted;
}

- (void).cxx_destruct
{
  boost::circular_buffer<int,std::allocator<int>>::destroy((uint64_t)&self->_state.mObject);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
