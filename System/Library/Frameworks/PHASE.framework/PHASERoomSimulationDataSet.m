@implementation PHASERoomSimulationDataSet

+ (unint64_t)getEntityHandleAsInt:(id)a3
{
  return objc_msgSend(a3, "geoEntityHandle");
}

- (PHASERoomSimulationDataSet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASERoomSimulationDataSet;
  return -[PHASERoomSimulationDataSet init](&v3, sel_init);
}

- (int64_t)getImageSourceContainerSize
{
  return (uint64_t)(*(_QWORD *)&self->_anon_48[8] - *(_QWORD *)self->_anon_48) >> 4;
}

- (int64_t)getImageSourceIntersectionContainerSize:(int64_t)a3
{
  _QWORD *begin;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = self->_imageSourceIntersectionPoints.__begin_,
        0xAAAAAAAAAAAAAAABLL * (((char *)self->_imageSourceIntersectionPoints.__end_ - (char *)begin) >> 3) <= a3))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 76;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _imageSourceIntersectionPoints.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _imageSourceIntersectionPoints.size() is false.");
  }
  return (uint64_t)(begin[3 * a3 + 1] - begin[3 * a3]) >> 4;
}

- (int64_t)getIntersectionContainerSize
{
  return (uint64_t)(*(_QWORD *)&self->_anon_18[8] - *(_QWORD *)self->_anon_18) >> 4;
}

- (int64_t)getHistogramContainerSize
{
  return self->_timeFrequencyHistogramData.__end_ - self->_timeFrequencyHistogramData.__begin_;
}

- (int64_t)getEarlyResponseMetadataSize
{
  return self->_earlyResponseMetadata.mNumDirectionalEvents;
}

- (float)getRoomVolume
{
  return self->_roomData.mRoomVolume;
}

- (float)getSurfaceArea
{
  return self->_roomData.mSurfaceArea;
}

- (float)getMeanFreePath
{
  return self->_roomData.mMeanFreePath;
}

- (unint64_t)getRoomDataSubbandCount
{
  unint64_t result;
  NSObject *v4;
  std::runtime_error *exception;
  NSObject *v6;
  std::runtime_error *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  result = self->_roomData.mMeanAbsorption.__end_ - self->_roomData.mMeanAbsorption.__begin_;
  if (result != self->_roomData.mRt60.__end_ - self->_roomData.mRt60.__begin_)
  {
    v4 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)result) + 208));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "PHASERoomSimulationView.mm";
      v10 = 1024;
      v11 = 113;
      _os_log_impl(&dword_2164CC000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: _roomData.mMeanAbsorption.size() == _roomData.mRt60.size() is false.", (uint8_t *)&v8, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: _roomData.mMeanAbsorption.size() == _roomData.mRt60.size() is false.");
  }
  if (result != self->_roomData.mCenterFrequencies.__end_ - self->_roomData.mCenterFrequencies.__begin_)
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)result) + 208));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "PHASERoomSimulationView.mm";
      v10 = 1024;
      v11 = 115;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: _roomData.mMeanAbsorption.size() == _roomData.mCenterFrequencies.size() is false.", (uint8_t *)&v8, 0x12u);
    }
    v7 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v7, "PRECONDITION: _roomData.mMeanAbsorption.size() == _roomData.mCenterFrequencies.size() is false.");
  }
  return result;
}

- (float)getMeanAbsorptionAtSubband:(int64_t)a3
{
  float *begin;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = self->_roomData.mMeanAbsorption.__begin_,
        a3 >= (unint64_t)(self->_roomData.mMeanAbsorption.__end_ - begin)))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 123;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: subbandIndex >= 0 && subbandIndex < _roomData.mMeanAbsorption.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: subbandIndex >= 0 && subbandIndex < _roomData.mMeanAbsorption.size() is false.");
  }
  return begin[a3];
}

- (float)getEquivalentAbsorptionAreaAtSubband:(int64_t)a3
{
  float *begin;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = self->_roomData.mEquivalentAbsorptionArea.__begin_,
        a3 >= (unint64_t)(self->_roomData.mEquivalentAbsorptionArea.__end_ - begin)))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 131;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: subbandIndex >= 0 && subbandIndex < _roomData.mEquivalentAbsorptionArea.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: subbandIndex >= 0 && subbandIndex < _roomData.mEquivalentAbsorptionArea.size() is false.");
  }
  return begin[a3];
}

- (float)getRt60AtSubband:(int64_t)a3
{
  float *begin;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = self->_roomData.mRt60.__begin_, a3 >= (unint64_t)(self->_roomData.mRt60.__end_ - begin)))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 139;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: subbandIndex >= 0 && subbandIndex < _roomData.mRt60.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: subbandIndex >= 0 && subbandIndex < _roomData.mRt60.size() is false.");
  }
  return begin[a3];
}

- (float)getCenterFrequencyAtSubband:(int64_t)a3
{
  float *begin;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = self->_roomData.mCenterFrequencies.__begin_,
        a3 >= (unint64_t)(self->_roomData.mCenterFrequencies.__end_ - begin)))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 146;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: subbandIndex >= 0 && subbandIndex < _roomData.mCenterFrequencies.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: subbandIndex >= 0 && subbandIndex < _roomData.mCenterFrequencies.size() is false.");
  }
  return begin[a3];
}

- (double)getEarlyMetadataDirectionAt:(unint64_t)a3
{
  uint64_t v3;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0
    || (v3 = *((_QWORD *)a1 + 22), 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)a1 + 23) - v3) >> 2) <= a3))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 153;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _earlyResponseMetadata.mDirections.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _earlyResponseMetadata.mDirections.size() is false.");
  }
  return *(double *)(v3 + 12 * a3);
}

- (float)getEarlyMetadataDelayAt:(int64_t)a3
{
  float *begin;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = self->_earlyResponseMetadata.mDelaysInSeconds.__begin_,
        a3 >= (unint64_t)(self->_earlyResponseMetadata.mDelaysInSeconds.__end_ - begin)))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 161;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _earlyResponseMetadata.mDelaysInSeconds.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _earlyResponseMetadata.mDelaysInSeconds.size() is false.");
  }
  return begin[a3];
}

- (float)getEarlyMetadataPolarityAt:(int64_t)a3
{
  char *begin;
  float result;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = self->_earlyResponseMetadata.mInvertPolarity.__begin_,
        (char *)(self->_earlyResponseMetadata.mInvertPolarity.__end_ - begin) <= (char *)a3))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 168;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _earlyResponseMetadata.mInvertPolarity.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _earlyResponseMetadata.mInvertPolarity.size() is false.");
  }
  result = -1.0;
  if (!begin[a3])
    return 1.0;
  return result;
}

- (float)getEarlyMetadataSubbandGainAt:(int64_t)a3 subbandIndex:(int64_t)a4
{
  char *begin;
  uint64_t v5;
  char *v6;
  NSObject *v8;
  std::runtime_error *exception;
  NSObject *v10;
  std::runtime_error *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = (char *)self->_earlyResponseMetadata.mSubbandGains.__begin_,
        0xAAAAAAAAAAAAAAABLL * (((char *)self->_earlyResponseMetadata.mSubbandGains.__end_ - (char *)begin) >> 3) <= a3))
  {
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "PHASERoomSimulationView.mm";
      v14 = 1024;
      v15 = 176;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _earlyResponseMetadata.mSubbandGains.size() is false.", (uint8_t *)&v12, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _earlyResponseMetadata.mSubbandGains.size() is false.");
  }
  if (a4 < 0
    || (v6 = &begin[24 * a3],
        v5 = *(_QWORD *)v6,
        a4 >= (unint64_t)((uint64_t)(*((_QWORD *)v6 + 1) - *(_QWORD *)v6) >> 2)))
  {
    v10 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "PHASERoomSimulationView.mm";
      v14 = 1024;
      v15 = 179;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: subbandIndex >= 0 && subbandIndex < _earlyResponseMetadata.mSubbandGains[index].size() is false.", (uint8_t *)&v12, 0x12u);
    }
    v11 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v11, "PRECONDITION: subbandIndex >= 0 && subbandIndex < _earlyResponseMetadata.mSubbandGains[index].size() is false.");
  }
  return *(float *)(v5 + 4 * a4);
}

- (int64_t)getLateReverbMetadataSize
{
  return self->_lateReverberationMetadata.mNumDirectionalEvents;
}

- (double)getLateMetadataDirectionAt:(unint64_t)a3
{
  uint64_t v3;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0
    || (v3 = *((_QWORD *)a1 + 35), 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)a1 + 36) - v3) >> 2) <= a3))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 192;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _lateReverberationMetadata.mDirections.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _lateReverberationMetadata.mDirections.size() is false.");
  }
  return *(double *)(v3 + 12 * a3);
}

- (float)getLateMetadataDelayAt:(int64_t)a3
{
  float *begin;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = self->_lateReverberationMetadata.mDelaysInSeconds.__begin_,
        a3 >= (unint64_t)(self->_lateReverberationMetadata.mDelaysInSeconds.__end_ - begin)))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 200;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _lateReverberationMetadata.mDelaysInSeconds.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _lateReverberationMetadata.mDelaysInSeconds.size() is false.");
  }
  return begin[a3];
}

- (float)getLateMetadataPolarityAt:(int64_t)a3
{
  char *begin;
  float result;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = self->_lateReverberationMetadata.mInvertPolarity.__begin_,
        (char *)(self->_lateReverberationMetadata.mInvertPolarity.__end_ - begin) <= (char *)a3))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 207;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _lateReverberationMetadata.mInvertPolarity.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _lateReverberationMetadata.mInvertPolarity.size() is false.");
  }
  result = -1.0;
  if (!begin[a3])
    return 1.0;
  return result;
}

- (float)getLateMetadataSubbandGainAt:(int64_t)a3 subbandIndex:(int64_t)a4
{
  char *begin;
  uint64_t v5;
  char *v6;
  NSObject *v8;
  std::runtime_error *exception;
  NSObject *v10;
  std::runtime_error *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0
    || (begin = (char *)self->_lateReverberationMetadata.mSubbandGains.__begin_,
        0xAAAAAAAAAAAAAAABLL * (((char *)self->_lateReverberationMetadata.mSubbandGains.__end_ - (char *)begin) >> 3) <= a3))
  {
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "PHASERoomSimulationView.mm";
      v14 = 1024;
      v15 = 215;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _lateReverberationMetadata.mSubbandGains.size() is false.", (uint8_t *)&v12, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _lateReverberationMetadata.mSubbandGains.size() is false.");
  }
  if (a4 < 0
    || (v6 = &begin[24 * a3],
        v5 = *(_QWORD *)v6,
        a4 >= (unint64_t)((uint64_t)(*((_QWORD *)v6 + 1) - *(_QWORD *)v6) >> 2)))
  {
    v10 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "PHASERoomSimulationView.mm";
      v14 = 1024;
      v15 = 218;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: subbandIndex >= 0 && subbandIndex < _lateReverberationMetadata.mSubbandGains[index].size() is false.", (uint8_t *)&v12, 0x12u);
    }
    v11 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v11, "PRECONDITION: subbandIndex >= 0 && subbandIndex < _lateReverberationMetadata.mSubbandGains[index].size() is false.");
  }
  return *(float *)(v5 + 4 * a4);
}

- (PHASERoomSimulationDataSet)initWithRoomSimulationDebugView:(const void *)a3
{
  char *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  _BYTE *v13;
  size_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BYTE *v19;
  unint64_t v20;
  char *v21;
  void *v22;
  char *v23;
  unint64_t v24;
  __int128 v25;
  unint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  size_t v37;
  char *v38;
  __int128 v39;
  _QWORD *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)PHASERoomSimulationDataSet;
  v4 = -[PHASERoomSimulationDataSet init](&v60, sel_init);
  *((_QWORD *)v4 + 1) = *((_QWORD *)a3 + 2);
  *((_QWORD *)v4 + 2) = *((_QWORD *)a3 + 1);
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)(v4 + 24), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 5) - *((_QWORD *)a3 + 4)) >> 2));
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)(v4 + 48), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 5) - *((_QWORD *)a3 + 4)) >> 2));
  v6 = *((_QWORD *)v4 + 3);
  if (*((_QWORD *)v4 + 4) != v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = *((_QWORD *)a3 + 4) + v7;
      *(_QWORD *)&v5 = *(_QWORD *)v9;
      DWORD2(v5) = *(_DWORD *)(v9 + 8);
      *(_OWORD *)(v6 + 16 * v8) = v5;
      v10 = *((_QWORD *)a3 + 4) + v7;
      *(_QWORD *)&v5 = *(_QWORD *)(v10 + 12);
      DWORD2(v5) = *(_DWORD *)(v10 + 20);
      *(_OWORD *)(*((_QWORD *)v4 + 6) + 16 * v8++) = v5;
      v6 = *((_QWORD *)v4 + 3);
      v7 += 28;
    }
    while (v8 < (*((_QWORD *)v4 + 4) - v6) >> 4);
  }
  v11 = (char *)*((_QWORD *)v4 + 15);
  *((_QWORD *)v4 + 61) = *((_QWORD *)a3 + 7);
  v12 = (char *)*((_QWORD *)a3 + 9);
  *((_QWORD *)v4 + 62) = *((_QWORD *)a3 + 8);
  v13 = (_BYTE *)*((_QWORD *)a3 + 10);
  v14 = v13 - v12;
  v15 = (v13 - v12) >> 2;
  v16 = *((_QWORD *)v4 + 17);
  if (v15 > (v16 - (uint64_t)v11) >> 2)
  {
    if (v11)
    {
      *((_QWORD *)v4 + 16) = v11;
      operator delete(v11);
      v16 = 0;
      *((_QWORD *)v4 + 15) = 0;
      *((_QWORD *)v4 + 16) = 0;
      *((_QWORD *)v4 + 17) = 0;
    }
    if ((v14 & 0x8000000000000000) != 0)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v17 = v16 >> 1;
    if (v16 >> 1 <= v15)
      v17 = (v13 - v12) >> 2;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
      v18 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v18 = v17;
    std::vector<float>::__vallocate[abi:ne180100]((_QWORD *)v4 + 15, v18);
    v11 = (char *)*((_QWORD *)v4 + 16);
    goto LABEL_19;
  }
  v19 = (_BYTE *)*((_QWORD *)v4 + 16);
  v20 = (v19 - v11) >> 2;
  if (v20 >= v15)
  {
LABEL_19:
    if (v13 == v12)
      goto LABEL_22;
    v22 = v11;
    v23 = v12;
    goto LABEL_21;
  }
  v21 = &v12[4 * v20];
  if (v19 != v11)
  {
    memmove(v11, v12, v19 - v11);
    v11 = (char *)*((_QWORD *)v4 + 16);
  }
  v14 = v13 - v21;
  if (v13 != v21)
  {
    v22 = v11;
    v23 = v21;
LABEL_21:
    memmove(v22, v23, v14);
  }
LABEL_22:
  *((_QWORD *)v4 + 16) = &v11[v14];
  v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a3 + 14) - *((_QWORD *)a3 + 13)) >> 3);
  *((_QWORD *)v4 + 63) = v24;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)(v4 + 72), v24);
  v26 = *((_QWORD *)v4 + 63);
  v28 = (_QWORD *)*((_QWORD *)v4 + 12);
  v27 = (_QWORD *)*((_QWORD *)v4 + 13);
  v29 = 0xAAAAAAAAAAAAAAABLL * (v27 - v28);
  v30 = v26 - v29;
  if (v26 > v29)
  {
    v31 = *((_QWORD *)v4 + 14);
    if (0xAAAAAAAAAAAAAAABLL * ((v31 - (uint64_t)v27) >> 3) >= v30)
    {
      bzero(*((void **)v4 + 13), 24 * ((24 * v30 - 24) / 0x18) + 24);
      *((_QWORD *)v4 + 13) = &v27[3 * ((24 * v30 - 24) / 0x18) + 3];
      goto LABEL_50;
    }
    if (v26 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v32 = 0xAAAAAAAAAAAAAAABLL * ((v31 - (uint64_t)v28) >> 3);
    if (2 * v32 > v26)
      v26 = 2 * v32;
    if (v32 >= 0x555555555555555)
      v33 = 0xAAAAAAAAAAAAAAALL;
    else
      v33 = v26;
    if (v33 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v34 = (char *)operator new(24 * v33);
    v35 = &v34[8 * (v27 - v28)];
    v36 = &v34[24 * v33];
    v37 = 24 * ((24 * v30 - 24) / 0x18) + 24;
    bzero(v35, v37);
    v38 = &v35[v37];
    if (v27 == v28)
    {
      *((_QWORD *)v4 + 12) = v35;
      *((_QWORD *)v4 + 13) = v38;
      *((_QWORD *)v4 + 14) = v36;
      if (!v27)
        goto LABEL_50;
    }
    else
    {
      do
      {
        v39 = *(_OWORD *)(v27 - 3);
        v27 -= 3;
        HIDWORD(v25) = HIDWORD(v39);
        *(_OWORD *)(v35 - 24) = v39;
        v35 -= 24;
        *((_QWORD *)v35 + 2) = v27[2];
        *v27 = 0;
        v27[1] = 0;
        v27[2] = 0;
      }
      while (v27 != v28);
      v27 = (_QWORD *)*((_QWORD *)v4 + 12);
      v40 = (_QWORD *)*((_QWORD *)v4 + 13);
      *((_QWORD *)v4 + 12) = v35;
      *((_QWORD *)v4 + 13) = v38;
      *((_QWORD *)v4 + 14) = v36;
      if (v40 != v27)
      {
        v41 = v40;
        do
        {
          v43 = (void *)*(v41 - 3);
          v41 -= 3;
          v42 = v43;
          if (v43)
          {
            *(v40 - 2) = v42;
            operator delete(v42);
          }
          v40 = v41;
        }
        while (v41 != v27);
      }
      if (!v27)
        goto LABEL_50;
    }
    operator delete(v27);
    goto LABEL_50;
  }
  if (v26 < v29)
  {
    v44 = &v28[3 * v26];
    if (v27 != v44)
    {
      v45 = (_QWORD *)*((_QWORD *)v4 + 13);
      do
      {
        v47 = (void *)*(v45 - 3);
        v45 -= 3;
        v46 = v47;
        if (v47)
        {
          *(v27 - 2) = v46;
          operator delete(v46);
        }
        v27 = v45;
      }
      while (v45 != v44);
    }
    *((_QWORD *)v4 + 13) = v44;
  }
LABEL_50:
  v48 = *((_QWORD *)v4 + 9);
  if (*((_QWORD *)v4 + 10) != v48)
  {
    v49 = 0;
    do
    {
      v50 = *((_QWORD *)a3 + 13) + 40 * v49;
      *(_QWORD *)&v25 = *(_QWORD *)v50;
      DWORD2(v25) = *(_DWORD *)(v50 + 8);
      *(_OWORD *)(v48 + 16 * v49) = v25;
      v51 = *((_QWORD *)a3 + 13) + 40 * v49;
      v53 = *(_QWORD *)(v51 + 16);
      v52 = *(_QWORD *)(v51 + 24);
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(*((_QWORD *)v4 + 12) + 24 * v49, 0xAAAAAAAAAAAAAAABLL * ((v52 - v53) >> 2));
      if (v52 != v53)
      {
        v54 = 0;
        v55 = 0;
        if (0xAAAAAAAAAAAAAAABLL * ((v52 - v53) >> 2) <= 1)
          v56 = 1;
        else
          v56 = 0xAAAAAAAAAAAAAAABLL * ((v52 - v53) >> 2);
        do
        {
          v57 = *(_QWORD *)(*((_QWORD *)a3 + 13) + 40 * v49 + 16) + v54;
          *(_QWORD *)&v25 = *(_QWORD *)v57;
          DWORD2(v25) = *(_DWORD *)(v57 + 8);
          *(_OWORD *)(*(_QWORD *)(*((_QWORD *)v4 + 12) + 24 * v49) + 16 * v55++) = v25;
          v54 += 12;
        }
        while (v56 != v55);
      }
      ++v49;
      v48 = *((_QWORD *)v4 + 9);
    }
    while (v49 < (*((_QWORD *)v4 + 10) - v48) >> 4);
  }
  *((_QWORD *)v4 + 21) = *((_QWORD *)a3 + 16);
  if (v4 + 168 != (char *)a3 + 128)
  {
    std::vector<Phase::Vector<float,3ul>>::__assign_with_size[abi:ne180100]<Phase::Vector<float,3ul>*,Phase::Vector<float,3ul>*>((_QWORD *)v4 + 22, *((_DWORD **)a3 + 17), *((_DWORD **)a3 + 18), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 18) - *((_QWORD *)a3 + 17)) >> 2));
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v4 + 200, *((char **)a3 + 20), *((_QWORD *)a3 + 21), (uint64_t)(*((_QWORD *)a3 + 21) - *((_QWORD *)a3 + 20)) >> 2);
    std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>((uint64_t)(v4 + 224), *((_QWORD *)a3 + 23), *((_QWORD *)a3 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 24) - *((_QWORD *)a3 + 23)) >> 3));
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>((_QWORD *)v4 + 31, *((char **)a3 + 26), *((char **)a3 + 27), *((_QWORD *)a3 + 27) - *((_QWORD *)a3 + 26));
  }
  *((_QWORD *)v4 + 34) = *((_QWORD *)a3 + 29);
  if (v4 + 272 != (char *)a3 + 232)
  {
    std::vector<Phase::Vector<float,3ul>>::__assign_with_size[abi:ne180100]<Phase::Vector<float,3ul>*,Phase::Vector<float,3ul>*>((_QWORD *)v4 + 35, *((_DWORD **)a3 + 30), *((_DWORD **)a3 + 31), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 31) - *((_QWORD *)a3 + 30)) >> 2));
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v4 + 304, *((char **)a3 + 33), *((_QWORD *)a3 + 34), (uint64_t)(*((_QWORD *)a3 + 34) - *((_QWORD *)a3 + 33)) >> 2);
    std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>((uint64_t)(v4 + 328), *((_QWORD *)a3 + 36), *((_QWORD *)a3 + 37), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 37) - *((_QWORD *)a3 + 36)) >> 3));
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>((_QWORD *)v4 + 44, *((char **)a3 + 39), *((char **)a3 + 40), *((_QWORD *)a3 + 40) - *((_QWORD *)a3 + 39));
  }
  v58 = *((_QWORD *)a3 + 42);
  *((_DWORD *)v4 + 96) = *((_DWORD *)a3 + 86);
  *((_QWORD *)v4 + 47) = v58;
  if (v4 + 376 != (char *)a3 + 336)
  {
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v4 + 392, *((char **)a3 + 44), *((_QWORD *)a3 + 45), (uint64_t)(*((_QWORD *)a3 + 45) - *((_QWORD *)a3 + 44)) >> 2);
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v4 + 416, *((char **)a3 + 47), *((_QWORD *)a3 + 48), (uint64_t)(*((_QWORD *)a3 + 48) - *((_QWORD *)a3 + 47)) >> 2);
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v4 + 440, *((char **)a3 + 50), *((_QWORD *)a3 + 51), (uint64_t)(*((_QWORD *)a3 + 51) - *((_QWORD *)a3 + 50)) >> 2);
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v4 + 464, *((char **)a3 + 53), *((_QWORD *)a3 + 54), (uint64_t)(*((_QWORD *)a3 + 54) - *((_QWORD *)a3 + 53)) >> 2);
  }
  return (PHASERoomSimulationDataSet *)v4;
}

- (__n128)getOriginAtIndex:(unint64_t)a3
{
  uint64_t v3;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0 || (v3 = *((_QWORD *)a1 + 3), a3 >= (*((_QWORD *)a1 + 4) - v3) >> 4))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 269;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _rayOriginPoints.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _rayOriginPoints.size() is false.");
  }
  return *(__n128 *)(v3 + 16 * a3);
}

- (__n128)getIntersectionAtIndex:(unint64_t)a3
{
  uint64_t v3;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0 || (v3 = *((_QWORD *)a1 + 6), a3 >= (*((_QWORD *)a1 + 7) - v3) >> 4))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 275;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _rayIntersectPoints.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _rayIntersectPoints.size() is false.");
  }
  return *(__n128 *)(v3 + 16 * a3);
}

- (__n128)getImageSourceLocationAtIndex:(unint64_t)a3
{
  uint64_t v3;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0 || (v3 = *((_QWORD *)a1 + 9), a3 >= (*((_QWORD *)a1 + 10) - v3) >> 4))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASERoomSimulationView.mm";
      v9 = 1024;
      v10 = 281;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _imageSourcePoints.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _imageSourcePoints.size() is false.");
  }
  return *(__n128 *)(v3 + 16 * a3);
}

- (__n128)getImageSourceIntersectionAt:(unint64_t)a3 intersectionIndex:(unint64_t)a4
{
  uint64_t v4;
  NSObject *v6;
  std::runtime_error *exception;
  NSObject *v8;
  std::runtime_error *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0 || a3 >= (uint64_t)(*((_QWORD *)a1 + 10) - *((_QWORD *)a1 + 9)) >> 4)
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 208));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "PHASERoomSimulationView.mm";
      v12 = 1024;
      v13 = 287;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: ISindex >= 0 && ISindex < _imageSourcePoints.size() is false.", (uint8_t *)&v10, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: ISindex >= 0 && ISindex < _imageSourcePoints.size() is false.");
  }
  if ((a4 & 0x8000000000000000) != 0
    || (v4 = *(_QWORD *)(*((_QWORD *)a1 + 12) + 24 * a3),
        a4 >= (*(_QWORD *)(*((_QWORD *)a1 + 12) + 24 * a3 + 8) - v4) >> 4))
  {
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 208));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "PHASERoomSimulationView.mm";
      v12 = 1024;
      v13 = 289;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: intersectionIndex >= 0 && intersectionIndex < _imageSourceIntersectionPoints[ISindex].size() is false.", (uint8_t *)&v10, 0x12u);
    }
    v9 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v9, "PRECONDITION: intersectionIndex >= 0 && intersectionIndex < _imageSourceIntersectionPoints[ISindex].size() is false.");
  }
  return *(__n128 *)(v4 + 16 * a4);
}

- (float)getTimeHistogramBin:(int64_t)a3 timeIndex:(int64_t)a4
{
  unint64_t numHistogramTimeSteps;
  NSObject *v6;
  std::runtime_error *exception;
  NSObject *v8;
  std::runtime_error *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0 || self->_numHistogramFrequencies <= a3)
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "PHASERoomSimulationView.mm";
      v12 = 1024;
      v13 = 296;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: fIndex >= 0 && fIndex < _numHistogramFrequencies is false.", (uint8_t *)&v10, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: fIndex >= 0 && fIndex < _numHistogramFrequencies is false.");
  }
  if (a4 < 0 || (numHistogramTimeSteps = self->_numHistogramTimeSteps, numHistogramTimeSteps <= a4))
  {
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "PHASERoomSimulationView.mm";
      v12 = 1024;
      v13 = 297;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: tIndex >= 0 && tIndex < _numHistogramTimeSteps is false.", (uint8_t *)&v10, 0x12u);
    }
    v9 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v9, "PRECONDITION: tIndex >= 0 && tIndex < _numHistogramTimeSteps is false.");
  }
  return self->_timeFrequencyHistogramData.__begin_[a4 + numHistogramTimeSteps * a3];
}

- (unint64_t)numHistogramFrequencies
{
  return self->_numHistogramFrequencies;
}

- (void)setNumHistogramFrequencies:(unint64_t)a3
{
  self->_numHistogramFrequencies = a3;
}

- (unint64_t)numHistogramTimeSteps
{
  return self->_numHistogramTimeSteps;
}

- (void)setNumHistogramTimeSteps:(unint64_t)a3
{
  self->_numHistogramTimeSteps = a3;
}

- (unint64_t)numImageSources
{
  return self->_numImageSources;
}

- (void)setNumImageSources:(unint64_t)a3
{
  self->_numImageSources = a3;
}

- (unint64_t)sourceHandle
{
  return self->_sourceHandle;
}

- (void)setSourceHandle:(unint64_t)a3
{
  self->_sourceHandle = a3;
}

- (unint64_t)listenerHandle
{
  return self->_listenerHandle;
}

- (void)setListenerHandle:(unint64_t)a3
{
  self->_listenerHandle = a3;
}

- (void).cxx_destruct
{
  float *begin;
  float *v4;
  float *v5;
  float *v6;
  char *v7;
  float *v8;
  void *v9;
  char *v10;
  float *v11;
  void *v12;
  float *v13;
  float *v14;
  char *v15;
  char *end;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  vector<std::vector<float>, std::allocator<std::vector<float>>> *p_mSubbandGains;

  begin = self->_roomData.mCenterFrequencies.__begin_;
  if (begin)
  {
    self->_roomData.mCenterFrequencies.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_roomData.mRt60.__begin_;
  if (v4)
  {
    self->_roomData.mRt60.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_roomData.mEquivalentAbsorptionArea.__begin_;
  if (v5)
  {
    self->_roomData.mEquivalentAbsorptionArea.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_roomData.mMeanAbsorption.__begin_;
  if (v6)
  {
    self->_roomData.mMeanAbsorption.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->_lateReverberationMetadata.mInvertPolarity.__begin_;
  if (v7)
  {
    self->_lateReverberationMetadata.mInvertPolarity.__end_ = v7;
    operator delete(v7);
  }
  p_mSubbandGains = &self->_lateReverberationMetadata.mSubbandGains;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_mSubbandGains);
  v8 = self->_lateReverberationMetadata.mDelaysInSeconds.__begin_;
  if (v8)
  {
    self->_lateReverberationMetadata.mDelaysInSeconds.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->_lateReverberationMetadata.mDirections.__begin_;
  if (v9)
  {
    self->_lateReverberationMetadata.mDirections.__end_ = v9;
    operator delete(v9);
  }
  v10 = self->_earlyResponseMetadata.mInvertPolarity.__begin_;
  if (v10)
  {
    self->_earlyResponseMetadata.mInvertPolarity.__end_ = v10;
    operator delete(v10);
  }
  p_mSubbandGains = &self->_earlyResponseMetadata.mSubbandGains;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_mSubbandGains);
  v11 = self->_earlyResponseMetadata.mDelaysInSeconds.__begin_;
  if (v11)
  {
    self->_earlyResponseMetadata.mDelaysInSeconds.__end_ = v11;
    operator delete(v11);
  }
  v12 = self->_earlyResponseMetadata.mDirections.__begin_;
  if (v12)
  {
    self->_earlyResponseMetadata.mDirections.__end_ = v12;
    operator delete(v12);
  }
  v13 = self->_directionalHistogramData.__begin_;
  if (v13)
  {
    self->_directionalHistogramData.__end_ = v13;
    operator delete(v13);
  }
  v14 = self->_timeFrequencyHistogramData.__begin_;
  if (v14)
  {
    self->_timeFrequencyHistogramData.__end_ = v14;
    operator delete(v14);
  }
  v15 = (char *)self->_imageSourceIntersectionPoints.__begin_;
  if (v15)
  {
    end = (char *)self->_imageSourceIntersectionPoints.__end_;
    v17 = self->_imageSourceIntersectionPoints.__begin_;
    if (end != v15)
    {
      v18 = (char *)self->_imageSourceIntersectionPoints.__end_;
      do
      {
        v20 = (void *)*((_QWORD *)v18 - 3);
        v18 -= 24;
        v19 = v20;
        if (v20)
        {
          *((_QWORD *)end - 2) = v19;
          operator delete(v19);
        }
        end = v18;
      }
      while (v18 != v15);
      v17 = self->_imageSourceIntersectionPoints.__begin_;
    }
    self->_imageSourceIntersectionPoints.__end_ = v15;
    operator delete(v17);
  }
  v21 = *(void **)self->_anon_48;
  if (v21)
  {
    *(_QWORD *)&self->_anon_48[8] = v21;
    operator delete(v21);
  }
  v22 = *(void **)self->_anon_30;
  if (v22)
  {
    *(_QWORD *)&self->_anon_30[8] = v22;
    operator delete(v22);
  }
  v23 = *(void **)self->_anon_18;
  if (v23)
  {
    *(_QWORD *)&self->_anon_18[8] = v23;
    operator delete(v23);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end
