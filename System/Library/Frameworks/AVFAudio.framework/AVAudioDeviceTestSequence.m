@implementation AVAudioDeviceTestSequence

- (AVAudioDeviceTestSequence)init
{
  AVAudioDeviceTestSequence *v2;
  AVAudioDeviceTestSequence *v3;
  NSString *mode;
  NSURL *stimulusURL;
  AVAudioDeviceTestProcessingChain *inputProcessingChain;
  AVAudioDeviceTestProcessingChain *outputProcessingChain;
  NSArray *micBufferNumbers;
  NSArray *v9;
  NSString *microphone;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVAudioDeviceTestSequence;
  v2 = -[AVAudioDeviceTestSequence init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    mode = v2->_mode;
    v2->_mode = 0;

    v3->_calculateCrossCorrelationPeak = 0;
    stimulusURL = v3->_stimulusURL;
    v3->_stimulusURL = 0;

    v3->_outputID = 0;
    v3->_outputMode = 0;
    v3->_volume = 0.5;
    inputProcessingChain = v3->_inputProcessingChain;
    v3->_inputProcessingChain = 0;

    outputProcessingChain = v3->_outputProcessingChain;
    v3->_outputProcessingChain = 0;

    v3->_processSequenceAsynchronously = 0;
    v3->_parallelCrossCorrelationCalculation = 0;
    micBufferNumbers = v3->_micBufferNumbers;
    v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    v3->_numberOfChannels = 0;
    v3->_micBufferNumbers = v9;

    v3->_requiresBluetoothOutput = 0;
    microphone = v3->_microphone;
    v3->_microphone = 0;

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *stimulusURL;
  double v5;
  id v6;

  stimulusURL = self->_stimulusURL;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", stimulusURL, CFSTR("stimulusURL"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_outputID, CFSTR("outputID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_outputMode, CFSTR("outputMode"));
  *(float *)&v5 = self->_volume;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("volume"), v5);
  objc_msgSend(v6, "encodeObject:forKey:", self->_inputProcessingChain, CFSTR("inputProcessingChain"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_outputProcessingChain, CFSTR("outputProcessingChain"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_calculateCrossCorrelationPeak, CFSTR("calculateCrossCorrelationPeak"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_processSequenceAsynchronously, CFSTR("processSequenceAsynchronously"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_parallelCrossCorrelationCalculation, CFSTR("parallelCrossCorrelationCalculation"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_numberOfChannels, CFSTR("numberOfChannels"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_micBufferNumbers, CFSTR("micBufferNumbers"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_requiresBluetoothOutput, CFSTR("requiresBluetoothOutput"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_microphone, CFSTR("microphone"));

}

- (AVAudioDeviceTestSequence)initWithCoder:(id)a3
{
  id v4;
  AVAudioDeviceTestSequence *v5;
  uint64_t v6;
  NSURL *stimulusURL;
  float v8;
  uint64_t v9;
  AVAudioDeviceTestProcessingChain *inputProcessingChain;
  uint64_t v11;
  AVAudioDeviceTestProcessingChain *outputProcessingChain;
  uint64_t v13;
  NSString *mode;
  uint64_t v15;
  NSArray *micBufferNumbers;
  uint64_t v17;
  NSString *microphone;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AVAudioDeviceTestSequence;
  v5 = -[AVAudioDeviceTestSequence init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stimulusURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    stimulusURL = v5->_stimulusURL;
    v5->_stimulusURL = (NSURL *)v6;

    v5->_outputID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputID"));
    v5->_outputMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputMode"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("volume"));
    v5->_volume = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputProcessingChain"));
    v9 = objc_claimAutoreleasedReturnValue();
    inputProcessingChain = v5->_inputProcessingChain;
    v5->_inputProcessingChain = (AVAudioDeviceTestProcessingChain *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputProcessingChain"));
    v11 = objc_claimAutoreleasedReturnValue();
    outputProcessingChain = v5->_outputProcessingChain;
    v5->_outputProcessingChain = (AVAudioDeviceTestProcessingChain *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
    v13 = objc_claimAutoreleasedReturnValue();
    mode = v5->_mode;
    v5->_mode = (NSString *)v13;

    v5->_calculateCrossCorrelationPeak = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("calculateCrossCorrelationPeak"));
    v5->_processSequenceAsynchronously = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("processSequenceAsynchronously"));
    v5->_parallelCrossCorrelationCalculation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("parallelCrossCorrelationCalculation"));
    v5->_numberOfChannels = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberOfChannels"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("micBufferNumbers"));
    v15 = objc_claimAutoreleasedReturnValue();
    micBufferNumbers = v5->_micBufferNumbers;
    v5->_micBufferNumbers = (NSArray *)v15;

    v5->_requiresBluetoothOutput = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresBluetoothOutput"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("microphone"));
    v17 = objc_claimAutoreleasedReturnValue();
    microphone = v5->_microphone;
    v5->_microphone = (NSString *)v17;

  }
  return v5;
}

- (int64_t)outputID
{
  return self->_outputID;
}

- (void)setOutputID:(int64_t)a3
{
  self->_outputID = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (NSURL)stimulusURL
{
  return self->_stimulusURL;
}

- (void)setStimulusURL:(id)a3
{
  objc_storeStrong((id *)&self->_stimulusURL, a3);
}

- (AVAudioDeviceTestProcessingChain)inputProcessingChain
{
  return self->_inputProcessingChain;
}

- (void)setInputProcessingChain:(id)a3
{
  objc_storeStrong((id *)&self->_inputProcessingChain, a3);
}

- (AVAudioDeviceTestProcessingChain)outputProcessingChain
{
  return self->_outputProcessingChain;
}

- (void)setOutputProcessingChain:(id)a3
{
  objc_storeStrong((id *)&self->_outputProcessingChain, a3);
}

- (int64_t)outputMode
{
  return self->_outputMode;
}

- (void)setOutputMode:(int64_t)a3
{
  self->_outputMode = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSString)mode
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)calculateCrossCorrelationPeak
{
  return self->_calculateCrossCorrelationPeak;
}

- (void)setCalculateCrossCorrelationPeak:(BOOL)a3
{
  self->_calculateCrossCorrelationPeak = a3;
}

- (BOOL)parallelCrossCorrelationCalculation
{
  return self->_parallelCrossCorrelationCalculation;
}

- (void)setParallelCrossCorrelationCalculation:(BOOL)a3
{
  self->_parallelCrossCorrelationCalculation = a3;
}

- (int64_t)numberOfChannels
{
  return self->_numberOfChannels;
}

- (void)setNumberOfChannels:(int64_t)a3
{
  self->_numberOfChannels = a3;
}

- (NSArray)micBufferNumbers
{
  return self->_micBufferNumbers;
}

- (void)setMicBufferNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_micBufferNumbers, a3);
}

- (BOOL)requiresBluetoothOutput
{
  return self->_requiresBluetoothOutput;
}

- (void)setRequiresBluetoothOutput:(BOOL)a3
{
  self->_requiresBluetoothOutput = a3;
}

- (NSString)microphone
{
  return self->_microphone;
}

- (void)setMicrophone:(id)a3
{
  objc_storeStrong((id *)&self->_microphone, a3);
}

- (BOOL)processSequenceAsynchronously
{
  return self->_processSequenceAsynchronously;
}

- (void)setProcessSequenceAsynchronously:(BOOL)a3
{
  self->_processSequenceAsynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microphone, 0);
  objc_storeStrong((id *)&self->_micBufferNumbers, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_outputProcessingChain, 0);
  objc_storeStrong((id *)&self->_inputProcessingChain, 0);
  objc_storeStrong((id *)&self->_stimulusURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
